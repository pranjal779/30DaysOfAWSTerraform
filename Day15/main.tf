# [Resource: aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
# 14:36
resource "aws_vpc" "primary_vpc" {
  cidr_block           = var.primary_vpc_cidr
  provider             = aws.primary
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Primary-VPC-${var.primary}"
  }
}


# 18:19 - 19:06
resource "aws_vpc" "secondary_vpc" {
  cidr_block           = var.secondary_vpc_cidr
  provider             = aws.secondary
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Secondary-VPC-${var.secondary}"
  }
}


# 22:22
resource "aws_subnet" "primary_subnet" {
  provider                = aws.primary
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_vpc_cidr
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Primary-Subnet-${var.primary}"
    Environment = "Day15"
  }
}


# 26:03
resource "aws_subnet" "secondary_subnet" {
  provider                = aws.secondary
  vpc_id                  = aws_vpc.secondary_vpc.id
  cidr_block              = var.secondary_vpc_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Secondary-Subnet-${var.secondary}"
    Environment = "Day15"
  }
}


# 27:28 Internet Gateway
# primary Internet Gateway
resource "aws_internet_gateway" "primary_igw" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  tags = {
    Name        = "Primary-IGW-${var.primary}"
    Environment = "Day15"
  }
}


# secondary Internet Gateway
resource "aws_internet_gateway" "secondary_igw" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  tags = {
    Name        = "Seconday-IGW-${var.secondary}"
    Environment = "Day15"
  }
}


# 29:11
# aws_route_table
# Route table for Primary VPC
resource "aws_route_table" "primary_rt" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary_igw.id
  }

  tags = {
    Name        = "Primary-Route-Table"
    Environment = "Day15"
  }
}


# 29:44
# Route Table for Secondary VPC
resource "aws_route_table" "secondary_rt" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.secondary_igw.id
  }

  tags = {
    Name        = "Secondary-Route-Table"
    Environment = "Day15"
  }
}


# 30:23
# Associate route table with Primary subnet
resource "aws_route_table_association" "primary_rta" {
  provider       = aws.primary
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_rt.id
}

# Associate route table with Secondary subnet
resource "aws_route_table_association" "secondary_rta" {
  provider       = aws.secondary
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_rt.id
}


# 33:07
# VPC Peering Connection (Requester side - Primary VPC)
# Mandatory Resource
# A to B
resource "aws_vpc_peering_connection" "primary_to_secondary" {
  provider    = aws.primary
  vpc_id      = aws_vpc.primary_vpc.id   # source VPC ID from Primary VPC
  peer_vpc_id = aws_vpc.secondary_vpc.id # destination vpc - where we need to go
  peer_region = var.secondary            # where that location is as well # 33:54
  auto_accept = false

  tags = {
    Name        = "Primary-to-Secondary-Peering"
    Environment = "Day15"
    Side        = "Requester"
  }
}


# VPC Peering Connection Accepter (Accepter side - Secondary VPC)
# B to A
# 34:31 - This code will be removed due at timestamp 36:28
# because this resource is actually aws_vpc_peering_connection_accepter
# resource "aws_vpc_peering_connection" "secondary_to_primary" {
#   provider    = aws.secondary
#   vpc_id      = aws_vpc.secondary_vpc.id # source VPC ID from Secondary VPC
#   peer_vpc_id = aws_vpc.primary_vpc.id   # destination vpc - where we need to go
#   peer_region = var.primary              # where that location is as well # 34:31
#   auto_accept = false

#   tags = {
#     Name        = "Secondary_To_Primary-Peering"
#     Environment = "Day15"
#     Side        = "Requester"
#   }
# }


# VPC Peering Connection Accepter (Accepter side - Secondary VPC)
# B to A
# 35:46
resource "aws_vpc_peering_connection_accepter" "secondary_accepter" {
  provider                  = aws.secondary
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
  auto_accept               = true

  tags = {
    Name        = "Secondary-Peering-Accepter"
    Environment = "Day15"
    Side        = "Accepter"
  }
}



# 35:39
# Add route to Secondary VPC in Primary route table
resource "aws_route" "primary_to_secondary" {
  provider                  = aws.primary
  route_table_id            = aws_route_table.primary_rt.id
  destination_cidr_block    = var.secondary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}

# 36:45
# Add route to Primary VPC in Secondary route table
resource "aws_route" "secondary_to_primary" {
  provider                  = aws.secondary
  route_table_id            = aws_route_table.secondary_rt.id
  destination_cidr_block    = var.primary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}


# ----
# 37:07
# Security Group for Primary VPC EC2 instance
resource "aws_security_group" "primary_sg" {
  provider    = aws.primary
  name        = "primary-vpc-sg"
  description = "Security group for Primary VPC instance"
  vpc_id      = aws_vpc.primary_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP from Secondary VPC"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.secondary_vpc_cidr] # by ping protocol
  }

  # 38:04
  ingress {
    description = "All traffic from Secondary VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.secondary_vpc_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Primary-VPC-SG"
    Environment = "Day15"
  }
}

# 38:13
# Security Group for Secondary VPC EC2 instance
resource "aws_security_group" "secondary_sg" {
  provider    = aws.secondary
  name        = "secondary-vpc-sg"
  description = "Security group for Secondary VPC instance"
  vpc_id      = aws_vpc.secondary_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP from Primary VPC"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.primary_vpc_cidr]
  }

  ingress {
    description = "All traffic from Primary VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.primary_vpc_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Secondary-VPC-SG"
    Environment = "Demo"
  }
}

# EC2 Instance in Primary VPC
resource "aws_instance" "primary_instance" {
  provider               = aws.primary
  ami                    = data.aws_ami.primary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.primary_subnet.id
  vpc_security_group_ids = [aws_security_group.primary_sg.id]
  key_name               = var.primary_key_name # 42:54

  # 39:31
  user_data = local.primary_user_data # will have nginx config

  tags = {
    Name        = "Primary-VPC-Instance"
    Environment = "Day15"
    Region      = var.primary
  }

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}

# EC2 Instance in Secondary VPC
resource "aws_instance" "secondary_instance" {
  provider               = aws.secondary
  ami                    = data.aws_ami.secondary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.secondary_subnet.id
  vpc_security_group_ids = [aws_security_group.secondary_sg.id]
  key_name               = var.secondary_key_name # 42:43

  user_data = local.secondary_user_data

  tags = {
    Name        = "Secondary-VPC-Instance"
    Environment = "Day15"
    Region      = var.secondary
  }

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}
