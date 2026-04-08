variable "project_name" {
  default = "Project ALPHA Resource"
}

variable "s3_11_12" {
  description = "Tags for S3 bucket for Day 11 and 12"
  type        = map(string)
  default = {
    Name        = "s3tags"
    Environment = "practice"
  }
}

# 32:05 using merge
variable "created_tags" {
  default = {
    createdby    = "me"
    createdwhere = "vscode"
  }
}


# bucket naming
variable "bucket_naming" {
  default = "11-12_ProjectBucketNaming LONG Long name wCAPS+SPACES!!!"
}



# 41:09 security group eample
variable "allowed_ports" {
  default = "80,44,8080,3306"
}

variable "environment" {
  default = "dev"
}

# variable "instance_size" {
#   type = map(string)
#   default = {
#     instance_type     = "t3_micro"
#     description       = "setting instances size"
#     instance_platform = "aws"
#     createdby         = "pranjello"
#   }
# }

variable "instance_size" {
  default = {
    dev      = "t2.micro"
    stagging = "t3.small"
    prod     = "t3.large"
  }
}


variable "instance_type" {
  default = "t2.micro"

  validation {
    condition     = length(var.instance_type) >= 2 && length(var.instance_type) <= 20
    error_message = "instance type must be between 2 and 20 character"
  }

  validation {
    condition     = can(regex("^t[2-3]\\.", var.instance_type))
    error_message = "Instance type must start with t2 or t3"
  }
}


variable "backup_name" {
  default = "daily_backup"

  validation {
    condition     = endswith(var.backup_name, "_backup")
    error_message = "Backup name must end with '_backup'"
  }
}


variable "credentials" {
  default   = "xyz123"
  sensitive = true
}

# Type conversion
variable "user_location" {
  default = ["us-east-1", "us-west-2", "us-east-1"]
}

variable "default_location" {
  default = ["us-west-1"]
}


# number/calculations
variable "monthly_costs" {
  default = [-50, 100, 75, 200]
}

#  terraform plan | Select-String "positive_cost" -Context 0,5
# ╷
# │ Error: Reference to undeclared input variable
# │ 
# │   on main.tf line 37, in locals:
# │   37:   positive_cost = abs(var.monthly_costs)
# │ 
# │ An input variable with the name "monthly_costs" has not been declared. This variable can be declared with a variable "monthly_costs" {} block.
# ╵


# 28:21
output "total_cost" {
  value = local.total_cost
}

output "max_cost" {
  value = local.max_cost
}

output "min_cost" {
  value = local.min_cost
}

output "average_cost" {
  value = local.average_cost
}
