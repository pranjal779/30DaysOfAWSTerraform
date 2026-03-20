# when using each.key

 terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_s3_bucket.bucket_day08_set["01bucket-set-day08"] will be created

- resource "aws_s3_bucket" "bucket_day08_set" {
  - acceleration_status = (known after apply)
  - acl = (known after apply)
  - arn = (known after apply)
  - bucket = "01bucket-set-day08"
  - bucket_domain_name = (known after apply)
  - bucket_namespace = (known after apply)
  - bucket_prefix = (known after apply)
  - bucket_region = (known after apply)
  - bucket_regional_domain_name = (known after apply)
  - force_destroy = false
  - hosted_zone_id = (known after apply)
  - id = (known after apply)
  - object_lock_enabled = (known after apply)
  - policy = (known after apply)
  - region = "us-east-1"
  - request_payer = (known after apply)
  - tags = {
    - "Name" = "day08_sets_names_for_s3"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - tags_all = {
    - "Name" = "day08_sets_names_for_s3"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - website_domain = (known after apply)
  - website_endpoint = (known after apply)

  - cors_rule (known after apply)

  - grant (known after apply)

  - lifecycle_rule (known after apply)

  - logging (known after apply)

  - object_lock_configuration (known after apply)

  - replication_configuration (known after apply)

  - server_side_encryption_configuration (known after apply)

  - versioning (known after apply)

  - website (known after apply)
    }

# aws_s3_bucket.bucket_day08_set["02-day08bucket-set"] will be created

- resource "aws_s3_bucket" "bucket_day08_set" {
  - acceleration_status = (known after apply)
  - acl = (known after apply)
  - arn = (known after apply)
  - bucket = "02-day08bucket-set"
  - bucket_domain_name = (known after apply)
  - bucket_namespace = (known after apply)
  - bucket_prefix = (known after apply)
  - bucket_region = (known after apply)
  - bucket_regional_domain_name = (known after apply)
  - force_destroy = false
  - hosted_zone_id = (known after apply)
  - id = (known after apply)
  - object_lock_enabled = (known after apply)
  - policy = (known after apply)
  - region = "us-east-1"
  - request_payer = (known after apply)
  - tags = {
    - "Name" = "day08_sets_names_for_s3"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - tags_all = {
    - "Name" = "day08_sets_names_for_s3"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - website_domain = (known after apply)
  - website_endpoint = (known after apply)

  - cors_rule (known after apply)

  - grant (known after apply)

  - lifecycle_rule (known after apply)

  - logging (known after apply)

  - object_lock_configuration (known after apply)

  - replication_configuration (known after apply)

  - server_side_encryption_configuration (known after apply)

  - versioning (known after apply)

  - website (known after apply)
    }

# aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"] will be created

- resource "aws_s3_bucket" "bucket_day08_set" {
  - acceleration_status = (known after apply)
  - acl = (known after apply)
  - arn = (known after apply)
  - bucket = "03-bucket-set-day08"
  - bucket_domain_name = (known after apply)
  - bucket_namespace = (known after apply)
  - bucket_prefix = (known after apply)
  - bucket_region = (known after apply)
  - bucket_regional_domain_name = (known after apply)
  - force_destroy = false
  - hosted_zone_id = (known after apply)
  - id = (known after apply)
  - object_lock_enabled = (known after apply)
  - policy = (known after apply)
  - region = "us-east-1"
  - request_payer = (known after apply)
  - tags = {
    - "Name" = "day08_sets_names_for_s3"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - tags_all = {
    - "Name" = "day08_sets_names_for_s3"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - website_domain = (known after apply)
  - website_endpoint = (known after apply)

  - cors_rule (known after apply)

  - grant (known after apply)

  - lifecycle_rule (known after apply)

  - logging (known after apply)

  - object_lock_configuration (known after apply)

  - replication_configuration (known after apply)

  - server_side_encryption_configuration (known after apply)

  - versioning (known after apply)

  - website (known after apply)
    }

# aws_s3_bucket.bucket_day_08[0] will be created

- resource "aws_s3_bucket" "bucket_day_08" {
  - acceleration_status = (known after apply)
  - acl = (known after apply)
  - arn = (known after apply)
  - bucket = "myunique-bucket-day08-01"
  - bucket_domain_name = (known after apply)
  - bucket_namespace = (known after apply)
  - bucket_prefix = (known after apply)
  - bucket_region = (known after apply)
  - bucket_regional_domain_name = (known after apply)
  - force_destroy = false
  - hosted_zone_id = (known after apply)
  - id = (known after apply)
  - object_lock_enabled = (known after apply)
  - policy = (known after apply)
  - region = "us-east-1"
  - request_payer = (known after apply)
  - tags = {
    - "Name" = "day08"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - tags_all = {
    - "Name" = "day08"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - website_domain = (known after apply)
  - website_endpoint = (known after apply)

  - cors_rule (known after apply)

  - grant (known after apply)

  - lifecycle_rule (known after apply)

  - logging (known after apply)

  - object_lock_configuration (known after apply)

  - replication_configuration (known after apply)

  - server_side_encryption_configuration (known after apply)

  - versioning (known after apply)

  - website (known after apply)
    }

# aws_s3_bucket.bucket_day_08[1] will be created

- resource "aws_s3_bucket" "bucket_day_08" {
  - acceleration_status = (known after apply)
  - acl = (known after apply)
  - arn = (known after apply)
  - bucket = "day08bucket-02"
  - bucket_domain_name = (known after apply)
  - bucket_namespace = (known after apply)
  - bucket_prefix = (known after apply)
  - bucket_region = (known after apply)
  - bucket_regional_domain_name = (known after apply)
  - force_destroy = false
  - hosted_zone_id = (known after apply)
  - id = (known after apply)
  - object_lock_enabled = (known after apply)
  - policy = (known after apply)
  - region = "us-east-1"
  - request_payer = (known after apply)
  - tags = {
    - "Name" = "day08"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - tags_all = {
    - "Name" = "day08"
    - "created_by" = "terraform"
    - "created_on" = "2023-10-01"
      }
  - website_domain = (known after apply)
  - website_endpoint = (known after apply)

  - cors_rule (known after apply)

  - grant (known after apply)

  - lifecycle_rule (known after apply)

  - logging (known after apply)

  - object_lock_configuration (known after apply)

  - replication_configuration (known after apply)

  - server_side_encryption_configuration (known after apply)

  - versioning (known after apply)

  - website (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

 terraform plan | grep "will be created"  
grep: The term 'grep' is not recognized as a name of a cmdlet, function, script file, or executable program.  
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.  
 terraform plan | Select-String "will be created"

-# aws_s3_bucket.bucket_day08_set["01bucket-set-day08"] will be created

-# aws_s3_bucket.bucket_day08_set["02-day08bucket-set"] will be created

-# aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"] will be created

-# aws_s3_bucket.bucket_day_08[0] will be created

-# aws_s3_bucket.bucket_day_08[1] will be created



# when used depends_on:

### apply:

Plan: 5 to add, 0 to change, 0 to destroy.
aws_s3_bucket.bucket_day_08_list[1]: Creating...
aws_s3_bucket.bucket_day_08_list[0]: Creating...
aws_s3_bucket.bucket_day_08_list[1]: Creation complete after 7s [id=day08bucket-02]
aws_s3_bucket.bucket_day_08_list[0]: Creation complete after 7s [id=myunique-bucket-day08-01]
aws_s3_bucket.bucket_day08_set["01bucket-set-day08"]: Creating...
aws_s3_bucket.bucket_day08_set["02-day08bucket-set"]: Creating...
aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"]: Creating...
aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"]: Creation complete after 7s [id=03-bucket-set-day08]
aws_s3_bucket.bucket_day08_set["01bucket-set-day08"]: Creation complete after 7s [id=01bucket-set-day08]
aws_s3_bucket.bucket_day08_set["02-day08bucket-set"]: Creation complete after 7s [id=02-day08bucket-set]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

### but plan was:

 terraform plan | Select-String "will be created"

-# aws_s3_bucket.bucket_day08_set["01bucket-set-day08"] will be created  
-# aws_s3_bucket.bucket_day08_set["02-day08bucket-set"] will be created  
-# aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"] will be created
-# aws_s3_bucket.bucket_day_08_list[0] will be created
-# aws_s3_bucket.bucket_day_08_list[1] will be created

```sh
 terraform apply --auto-approve | Select-String "will be created"

  # aws_s3_bucket.bucket_day08_set["01bucket-set-day08"] will be created
  # aws_s3_bucket.bucket_day08_set["02-day08bucket-set"] will be created
  # aws_s3_bucket.bucket_day_08_list[0] will be created
  # aws_s3_bucket.bucket_day_08_list[1] will be created

 terraform apply
aws_s3_bucket.bucket_day_08_list[1]: Refreshing state... [id=day08bucket-02]
aws_s3_bucket.bucket_day_08_list[0]: Refreshing state... [id=myunique-bucket-day08-01]
aws_s3_bucket.bucket_day08_set["01bucket-set-day08"]: Refreshing state... [id=01bucket-set-day08]
aws_s3_bucket.bucket_day08_set["02-day08bucket-set"]: Refreshing state... [id=02-day08bucket-set]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

```

```sh
Plan: 5 to add, 0 to change, 0 to destroy.
aws_s3_bucket.bucket_day_08_list[1]: Creating...
aws_s3_bucket.bucket_day_08_list[0]: Creating...
aws_s3_bucket.bucket_day_08_list[1]: Creation complete after 7s [id=day08bucket-02]
aws_s3_bucket.bucket_day_08_list[0]: Creation complete after 7s [id=myunique-bucket-day08-01]
aws_s3_bucket.bucket_day08_set["01bucket-set-day08"]: Creating...
aws_s3_bucket.bucket_day08_set["02-day08bucket-set"]: Creating...
aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"]: Creating...
aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"]: Creation complete after 7s [id=03-bucket-set-day08]
aws_s3_bucket.bucket_day08_set["01bucket-set-day08"]: Creation complete after 7s [id=01bucket-set-day08]
aws_s3_bucket.bucket_day08_set["02-day08bucket-set"]: Creation complete after 7s [id=02-day08bucket-set]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```
