variable "environment" {
  default = "dev"
  type    = string
}

# 2nd varible for userName
variable "username" {
  type    = string
  default = "pranjals"
}

# 3rd for region
variable "region" {
  type    = string # timestamp 12:17
  default = "us-east-1"
}

# Variable for instance count timestamp 10:43
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

# Variable for Monitoring Timestamp 16:00
variable "monitoring_enabled" {
  description = "Enabled detailed monitoring for the EC2 instance"
  type        = bool
  default     = true
}

# Variable for associate_public_ip_address timestamp 16:12
variable "associate_public_ip_address" {
  description = "Associate a public IP address with the EC2 instance"
  type        = bool
  default     = true
}

# datatype list(string)
variable "cidr_block" {
  description = "CIDR block for the VPC ipv4 block in main file"
  type        = list(string)
  default     = ["10.0.0.0/16", "192.168.0.0/16", "172.16.0.0/16"]
}

variable "allowed_instance_type" {
  description = "List of Allowed Virtual Instances type"
  # type        = set(string) # you will get some kind of error
  type    = list(string)
  default = ["t3.micro", "t3.small", "t3.medium"]
}

data "aws_region" "current" {}


variable "allowed_regions" {
  description = "Set of allowed AWS regions for resource deployment"
  type        = list(string)
  default     = ["us-east-1", "us-west-1", "eu-west-1", "eu-west-1"]
}

variable "tags" {
  type = map(string)
  default = {
    Name       = "day09"
    created_by = "terraform"
    created_on = "2026-03-21"
  }
}



variable "tags_sets_s3" {
  type = map(string)
  default = {
    Name       = "day09_sets_names_for_s3"
    created_by = "terraform"
    created_on = "2023-10-01"
  }
}


variable "tags_condition_s3" {
  type = map(string)
  default = {
    Name        = "day09_post_condition_s3"
    Environment = "test"
    created_by  = "terraform"
    created_on  = "2023-10-01"
    Compliance  = "yes"
  }
}



variable "tagstls" {
  type = map(string)
  default = {
    Name       = "allow_tls"
    created_by = "terraform"
    created_on = "Day09Task"
  }
}

variable "ingress_tuple_type" {
  type    = tuple([number, string, number])
  default = [443, "tcp", 443]
}

# 50:08 - variable for object type
variable "config_type_object" {
  type = object({
    region              = string,
    monitoring_enabled  = bool,
    number_of_instances = number
  })
  default = {
    region              = "us-east-1",
    monitoring_enabled  = true,
    number_of_instances = 1
  }
}

variable "bucket_names_list" {
  description = "List of s3 bucket names to create"
  type        = list(string)
  default     = ["myunique-bucket-day09-01", "day09bucket-02", "bucket-day09-03"]
}

variable "bucket_names_set" {
  description = "List of s3 bucket names to create"
  type        = set(string)
  default     = ["01bucket-set-day09", "02-day09bucket-set"]
}

# , "03-bucket-set-day08"


# probably wrong tags
# variable "resource_tags" {
#   description = "Common tags to apply to resources"
#   type        = map(string)
#   default = {
#     Environment = "dev"
#     Team        = "DevOps"
#     CostCenter  = "Engineering"
#   }
# }


# variable "tags_asg_false" {
#   type = map(string)
#   default = {
#     Name                = "Demo"
#     value               = "ignore_changes"
#     propagate_at_launch = false
#   }

# }


# tags = {
#   key                 = "Name"
#   value               = "App Server ASG"
#   propagate_at_launch = true
# }
