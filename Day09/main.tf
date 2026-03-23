resource "aws_instance" "practice_day09" {
  ami           = "ami-0ff8a91507f77f867" # US East N. Virginia - HVM (SSD) EBS-Backed 64-bit from Amazon Linux AMI IDs page
  instance_type = var.allowed_instance_type[0]

  tags = var.tags

  lifecycle {
    # Lifecycle Rule: Create new instance before destroying the old one
    # This ensures zero downtime during instance updates (e.g., changing AMI or instance type)
    # create_before_destroy = true
  }
}


resource "aws_s3_bucket" "practice_day09_bucket" {
  bucket = "my-practice-day09-bucket"

  tags = var.tags
}


resource "aws_s3_bucket" "critical_data" {
  bucket = "my-critical-production-data-buckets3"

  tags = {
    Environment = "production"
    Name        = "Critical Bucket for Data"
  }

  # tags = merge(
  #   var.resource_tags,
  #   {
  #     Name       = "Critical Production Data Bucket"
  #     Demo       = "prevent_destroy"
  #     DataType   = "Critical"
  #     Compliance = "Required"
  #   }
  # )

  # Lifecycle Rule: Prevent accidental deletion of this bucket
  # Terraform will throw an error if you try to destroy this resource
  # To delete: Comment out prevent_destroy first, then run terraform apply
  lifecycle {
    prevent_destroy = true # COMMENTED OUT TO ALLOW DESTRUCTION
  }
}

# # vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv ###
# ########################################## AUTOSCALING GROUP PRCTICE ##########################################
# ### vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv ###

resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-1a2b3c"
  instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "app_servers" {
  name               = "app-server-asg"
  min_size           = 1
  max_size           = 5
  desired_capacity   = 2
  health_check_type  = "EC2"
  availability_zones = ["us-east-1a", "us-west-1a", "us-east-1b", "us-west-2c"]

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  # Lifecycle Rule: Ignore changes to desired_capacity
  # This is useful when auto-scaling policies or external systems modify capacity
  # Terraform won't try to revert capacity changes made outside of Terraform
  lifecycle {
    ignore_changes = [
      desired_capacity,
      # Also ignore load_balancers if added later by other processes
    ]
  }


}

# # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #
# #### AUTOSCALING GROUP PRACITICE END ###########################################


# # ==============================
# # Example 6: replace_triggered_by
# # Use Case: Replace EC2 instances when security group changes
# # ==============================


## [Resource: aws_default_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl)

# Security Group
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Security group for application servers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "App Security Group"
    Demo = "replace_triggered_by"
  }
}

# EC2 Instance that gets replaced when security group changes
resource "aws_instance" "app_with_sg" {
  ami                    = "ami-0ff8a91507f77f867"
  instance_type          = var.allowed_instance_type[0]
  vpc_security_group_ids = [aws_security_group.app_sg.id] # Argument Reference - see notes

  tags = {
    Name = "App Instance with Security Group"
    Demo = "replace_triggered_by"
  }

  # Lifecycle Rule: Replace instance when security group changes
  # This ensures the instance is recreated with new security rules
  lifecycle {
    replace_triggered_by = [
      aws_security_group.app_sg.id
    ]
  }
}


# # ==============================
# # Example 4: precondition
# # Use Case: Ensure we're deploying in an allowed region
# # ==============================

resource "aws_s3_bucket" "regional_validation" {
  bucket = "validated-region-bucket-precondition_practice"

  tags = {
    Name = "Region Validated Bucket"
    Demo = "precondition"
  }

  # Lifecycle Rule: Validate region before creating resource
  # This prevents resource creation in unauthorized regions
  # According to the Documentation: [Argument Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#argument-reference)
  # lifecycle_rule - is Optional and Deprecated - refer notes in readme
  lifecycle {
    precondition {
      condition     = contains(var.allowed_regions, data.aws_region.current.name)
      error_message = "ERROR: This resource can only be created in allowed regions: ${join(", ", var.allowed_regions)}. Current region: ${data.aws_region.current.name}"
    }
  }
}



# ==============================
# Example 5: postcondition
# Use Case: Ensure S3 bucket has required tags after creation
# ==============================

resource "aws_s3_bucket" "compliance_bucket" {
  bucket = "compliance-bucket-${var.environment}-${var.region}"

  tags = {
    Name       = "Compliance Validated Bucket"
    Demo       = "postcondition"
    Compliance = "SOC2"
  }

  # Lifecycle Rule: Validate bucket has required tags after creation
  # This ensures compliance with organizational tagging policies
  lifecycle {
    postcondition {
      condition     = contains(keys(var.tags_condition_s3), "Compliance") # actually needs to use var.tags_condition_s3
      error_message = "ERROR: Bucket must have a 'Compliance' tag for audit purposes!"
    }

    postcondition {
      condition     = contains(keys(var.tags_condition_s3), "Environment") # actually needs to use var.tags_condition_s3
      error_message = "ERROR: Bucket must have an 'Environment' tag!"
    }
  }
}
