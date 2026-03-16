[7/30 - AWS Terraform Type Constraints Explained (with realtime examples)](https://www.youtube.com/watch?v=gu2oCJ9DQiQ&list=PLl4APkPHzsUWr5H7mprC8O21Crq_NnbYx&index=25)

From the Doc:
associate_public_ip_address - (Optional) Whether to associate a public IP address with an instance in a VPC.

monitoring - (Optional) If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)

Resource: aws_security_group

Resource: aws_security_group_rule:

- cidr_blocks - (Optional) List of CIDR blocks. Cannot be specified with source_security_group_id or self.

[33:25]




 terraform plan
                                                                                                                                                
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:      
  + create                                                                                                                                      

Terraform will perform the following actions:

  # aws_instance.day07ec2[0] will be created
  + resource "aws_instance" "day07ec2" {
      + ami                                  = "ami-0c94855ba95c71c99"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = true
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name"       = "day07"
          + "created_by" = "terraform"
          + "created_on" = "2023-10-01"
        }
      + tags_all                             = {
          + "Name"       = "day07"
          + "created_by" = "terraform"
          + "created_on" = "2023-10-01"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + secondary_network_interface (known after apply)
    }

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic and all outbound traffic"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "allow_tls"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"       = "allow_tls"
          + "created_by" = "terraform"
          + "created_on" = "Day07Task"
        }
      + tags_all               = {
          + "Name"       = "allow_tls"
          + "created_by" = "terraform"
          + "created_on" = "Day07Task"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4 will be created
  + resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
    }

  # aws_vpc_security_group_ingress_rule.allow_tls_ipv4 will be created
  + resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "10.0.0.0/16"
      + from_port              = 443
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
      + to_port                = 443
    }

Plan: 4 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" 
now.