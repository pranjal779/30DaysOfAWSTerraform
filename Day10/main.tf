# Amazon Linux AMI https://aws.amazon.com/amazon-linux-ami/
# Conditional Expression
resource "aws_instance" "day10example" {
  ami           = "ami-0130c3a072f3832ff"
  count         = var.instance_count
  instance_type = var.environment == "dev" ? "t2.micro" : "t3.micro"
  # instance_type = "t3.micro"

  tags = var.tags

  #   tags = {
  #     Name        = "day10"
  #     Environment = "practice"
  #   }
}


# # Dynamic Block 14:15
# resource "aws_security_group" "ingress_rule_day10" {
#   name = "sg"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "http"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress = []
# }


# 26:54
# Dynamic block @2 example
resource "aws_security_group" "dynamic_sg" {
  name = "dynamicsg"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# splat expression
locals {
  all_instance_ids = aws_instance.day10example[*].id
}

output "instances" {
  value = local.all_instance_ids
}
