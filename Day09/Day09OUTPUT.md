 terraform plan
data.aws_region.current: Reading...                                                                                                                             
data.aws_region.current: Read complete after 0s [id=us-east-1]                                                                                                  

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_autoscaling_group.app_servers will be created
  + resource "aws_autoscaling_group" "app_servers" {
      + arn                              = (known after apply)
      + availability_zones               = [
          + "us-east-1",
          + "us-west-1",
        ]
      + default_cooldown                 = (known after apply)
      + desired_capacity                 = 2
      + force_delete                     = false
      + force_delete_warm_pool           = false
      + health_check_grace_period        = 300
      + health_check_type                = "EC2"
      + id                               = (known after apply)
      + ignore_failed_scaling_activities = false
      + load_balancers                   = (known after apply)
      + max_size                         = 5
      + metrics_granularity              = "1Minute"
      + min_size                         = 1
      + name                             = "app-server-asg"
      + name_prefix                      = (known after apply)
      + predicted_capacity               = (known after apply)
      + protect_from_scale_in            = false
      + region                           = "us-east-1"
      + service_linked_role_arn          = (known after apply)
      + target_group_arns                = (known after apply)
      + vpc_zone_identifier              = (known after apply)
      + wait_for_capacity_timeout        = "10m"
      + warm_pool_size                   = (known after apply)

      + availability_zone_distribution (known after apply)

      + capacity_reservation_specification (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = "$Latest"
        }

      + mixed_instances_policy (known after apply)

      + tag {
          + key                 = "foo"
          + propagate_at_launch = true
          + value               = "bar"
        }

      + traffic_source (known after apply)
    }

  # aws_instance.app_with_sg will be created
  + resource "aws_instance" "app_with_sg" {
      + ami                                  = "ami-0ff8a91507f77f867"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
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
      + monitoring                           = (known after apply)
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
          + "Demo" = "replace_triggered_by"
          + "Name" = "App Instance with Security Group"
        }
      + tags_all                             = {
          + "Demo" = "replace_triggered_by"
          + "Name" = "App Instance with Security Group"
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

  # aws_instance.practice_day09 will be created
  + resource "aws_instance" "practice_day09" {
      + ami                                  = "ami-0ff8a91507f77f867"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
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
      + monitoring                           = (known after apply)
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
          + "Name"       = "day09"
          + "created_by" = "terraform"
          + "created_on" = "2026-03-21"
        }
      + tags_all                             = {
          + "Name"       = "day09"
          + "created_by" = "terraform"
          + "created_on" = "2026-03-21"
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

  # aws_launch_template.foobar will be created
  + resource "aws_launch_template" "foobar" {
      + arn             = (known after apply)
      + default_version = (known after apply)
      + id              = (known after apply)
      + image_id        = "ami-1a2b3c"
      + instance_type   = "t3.micro"
      + latest_version  = (known after apply)
      + name            = (known after apply)
      + name_prefix     = "foobar"
      + region          = "us-east-1"
      + tags_all        = (known after apply)

      + metadata_options (known after apply)
    }

  # aws_s3_bucket.compliance_bucket will be created
  + resource "aws_s3_bucket" "compliance_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "compliance-bucket-preprod-us-east-1"
      + bucket_domain_name          = (known after apply)
      + bucket_namespace            = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_region               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = "us-east-1"
      + request_payer               = (known after apply)
      + tags                        = {
          + "Compliance" = "SOC2"
          + "Demo"       = "postcondition"
          + "Name"       = "Compliance Validated Bucket"
        }
      + tags_all                    = {
          + "Compliance" = "SOC2"
          + "Demo"       = "postcondition"
          + "Name"       = "Compliance Validated Bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_s3_bucket.critical_data will be created
  + resource "aws_s3_bucket" "critical_data" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-critical-production-data-buckets3"
      + bucket_domain_name          = (known after apply)
      + bucket_namespace            = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_region               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = "us-east-1"
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "production"
          + "Name"        = "Critical Bucket for Data"
        }
      + tags_all                    = {
          + "Environment" = "production"
          + "Name"        = "Critical Bucket for Data"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_s3_bucket.practice_day09_bucket will be created
  + resource "aws_s3_bucket" "practice_day09_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-practice-day09-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_namespace            = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_region               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = "us-east-1"
      + request_payer               = (known after apply)
      + tags                        = {
          + "Name"       = "day09"
          + "created_by" = "terraform"
          + "created_on" = "2026-03-21"
        }
      + tags_all                    = {
          + "Name"       = "day09"
          + "created_by" = "terraform"
          + "created_on" = "2026-03-21"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_s3_bucket.regional_validation will be created
  + resource "aws_s3_bucket" "regional_validation" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "validated-region-bucket-precondition_practice"
      + bucket_domain_name          = (known after apply)
      + bucket_namespace            = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_region               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = "us-east-1"
      + request_payer               = (known after apply)
      + tags                        = {
          + "Demo" = "precondition"
          + "Name" = "Region Validated Bucket"
        }
      + tags_all                    = {
          + "Demo" = "precondition"
          + "Name" = "Region Validated Bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_security_group.app_sg will be created
  + resource "aws_security_group" "app_sg" {
      + arn                    = (known after apply)
      + description            = "Security group for application servers"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow all outbound traffic"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow HTTP from anywhere"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow HTTPS from anywhere"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
        ]
      + name                   = "app-security-group"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Demo" = "replace_triggered_by"
          + "Name" = "App Security Group"
        }
      + tags_all               = {
          + "Demo" = "replace_triggered_by"
          + "Name" = "App Security Group"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 9 to add, 0 to change, 0 to destroy.
╷
│ Warning: Deprecated attribute
│
│   on main.tf line 177, in resource "aws_s3_bucket" "regional_validation":
│  177:       condition     = contains(var.allowed_regions, data.aws_region.current.name)
│
│ The attribute "name" is deprecated. Refer to the provider documentation for details.
│
│ (and one more similar warning elsewhere)
╵

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
