# Create a EC2
resource "aws_instance" "day07ec2" {
  count         = var.instance_count           # variable defined in variables.tf and number defined in terraform.tfvars
  ami           = "ami-0c94855ba95c71c99"      # Amazon Linux 2 AMI
  instance_type = var.allowed_instance_type[0] # using the first instance type from the list defined in variables.tf
  # region        = tolist(var.allowed_regions)[0] # for object type
  region = var.config_type_object.region # for object type [50:08]

  monitoring                  = var.monitoring_enabled
  associate_public_ip_address = var.associate_public_ip_address

  tags = var.tags
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = var.tagstls
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0] # or use the Resource: aws_security_group_rule: - cidr_blocks 
  from_port         = var.ingress_tuple_type[0]
  ip_protocol       = var.ingress_tuple_type[1]
  to_port           = var.ingress_tuple_type[2]
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
