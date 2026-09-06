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
  region = var.primary
  alias  = "primary"

}

# Secondary region
provider "aws" {
  region = var.secondary
  alias  = "secondary"
}
