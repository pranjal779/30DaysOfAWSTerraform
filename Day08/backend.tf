terraform {
  backend "s3" {
    bucket = "day08practicebucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
