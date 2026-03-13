terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "day04-tf-bucket-backend"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_day04_bucket" {
  bucket = "day04-tf-bucket"

  tags = {
    Name        = "day04-tf-bucket"
    Environment = "dev"
  }
}
