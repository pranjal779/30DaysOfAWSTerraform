# Data Source: aws_vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
variable "aws_vpc" {

}

data "aws_vpc" "vpc_day13" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnet" "shared" {
  filter {
    name   = "tag:Name"
    values = ["subnetA"]
  }
  vpc_id = data.aws_vpc.vpc_day13.id
  # Data Source: aws_subnet - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet

}

# Data Source for AMI
# Data Source: aws_ami > EC2 > aws_ami - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "linux2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["myami-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# Amazon Linux AMI https://aws.amazon.com/amazon-linux-ami/
# Conditional Expression
resource "aws_instance" "day10example" {
  ami           = data.aws_ami.linux2.id
  instance_type = "t2.micro"
  # instance_type = "t3.micro"
  subnet_id = data.aws_subnet.shared.id

  tags = var.tags

}
