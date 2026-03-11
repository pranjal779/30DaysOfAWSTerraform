terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create a S3 bucket
# Resource: aws_s3_bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "my-first-30daysofawstf-s3bucket"

  tags = {
    Name        = "My_Bucket 2.0"
    Environment = "Dev"
  }
}


# # Secondary Provider (N. Virginia)
# provider "aws" {
#   alias  = "us_east"
#   region = "us-east-1"
# }

# # Create a S3 bucket in us-east-1 region
# resource "aws-s3-bucket" "virginia_bucket" {
#   provider = "aws.us_east"
#   region = "us-east-1"
#   bucket = "virginia-bucket-30daysofawstf"

#   tags = {
#     Name        = "My_Bucket_1.0_us-east-1"
#     Environment = "Dev"
#   }
# }
