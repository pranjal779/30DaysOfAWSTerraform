terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# 5:31
# Variable example - Input type
# (we are defining a variable called environment with a default value of dev and the type is string)
variable "environment" {
  default = "dev"
  type    = string
}

# 2nd varible for userName timestamp 14:35
variable "username" {
  default = "pranjals"
}

# 3rd for region # 16:58 timestamp
variable "region" {
  default = "us-east-1"
}


# locals type timestamp 12:42
locals {
  bucket_name        = "${var.environment}-${var.username}-bucket"
  vpc_name           = "${var.environment}-VPC"
  ec2_name           = "${var.environment}-EC2"
  bucket_name_region = "${var.environment}-${var.username}-bucket-${var.region}"

  # the following error will occur if we try to use local variables without declaring them in the locals block
  # bucket_name = "${local.env}-Bucket" # No declaration found for "local.env"
  # vpc_name = "${local.env}-VPC" # No declaration found for "local.env"
  # ec2_name = "${local.env}-EC2" # No declaration found for "local.env"
}

# Create an s3 bucket
resource "aws_s3_bucket" "my_day05_bucket" {
  # bucket = "day05-tf-bucket"
  # bucket = "${local.bucket_name}-day05-tf-bucket" # my example
  bucket = local.bucket_name # using the local variable in the name of the bucket

  tags = {
    # Name        = "day05-tf-bucket" -> original
    # Name        = "Dev-Bucket" # Local variable example # 10:02 timestamp
    # Name        = "${var.environment}-Bucket" # 11:05-11:28 timestamp - using the variable in the name of the bucket
    Name = local.bucket_name # 15:42 timestamp - using the local variable in the name of the bucket
    # Environment = "var.environment" -> variable example
    Environment = local.bucket_name
  }
}

# 18:31 timestamp
# create another s3 bucket for region name local variable example
resource "aws_s3_bucket" "bucketname_w_region" {
  bucket = local.bucket_name_region

  tags = {
    Name        = "${local.bucket_name_region}-02bucket"
    Environment = "${local.bucket_name_region}-02bucketEnvironment"

  }
}


# create a Vpc
resource "aws_vpc" "day05vpc" {
  cidr_block = "10.0.1.0/24"
  # region     = var.region # region     = "us-east-1" -> original # so this is incorrect this should not be here because VPC is a global resource and does not have a region attribute.

  tags = {
    # Name        = "Dev-VPC" -> original
    # Name        = "${var.environment}-VPC" # local variable example
    Name = local.vpc_name # 16:08 timestamp
    # Environment = "var.environment"
    Environment = local.vpc_name
  }
}

# Create a EC2
resource "aws_instance" "day05ec2" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  # region        = var.region # region        = "us-east-1" -> original  # this is incorrect this should not be here because EC2 is a regional resource and the region is determined by the provider configuration.

  tags = {
    # Name        = "Dev-EC2"
    # Name        = "${var.environment}-EC2"
    Name = local.ec2_name
    # or
    #Name = "${local.ec2_name}-${var.username}-EC2"
    # Environment = "var.environment"
    Environment = local.ec2_name
  }
}

# 22:38 Output variable lesson
output "vpc_id" {
  value = aws_vpc.day05vpc.id
}

output "vpc_region" {
  value = aws_vpc.day05vpc.region
}

output "ec2_id" {
  value = aws_instance.day05ec2.id
}

output "aws_s3_bucket_name" {
  value = aws_s3_bucket.bucketname_w_region.bucket
}

output "aws_s3_bucket_name02" {
  value = aws_s3_bucket.my_day05_bucket.id
}


# 26:26
# after this Variable Precedence
