[Resource: aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

Resource Created:
my-first-30daysofawstf-s3bucket
Asia Pacific (Mumbai) ap-south-1
March 11, 2026, 09:52:20 (UTC+05:30)

after updating the tags:
 terraform plan  
aws_s3_bucket.first_bucket: Refreshing state... [id=my-first-30daysofawstf-s3bucket]

Terraform used the selected providers to generate the following execution plan.  
Resource actions are indicated with the following symbols:
~ update in-place

Terraform will perform the following actions:

# aws_s3_bucket.first_bucket will be updated in-place

~ resource "aws_s3_bucket" "first_bucket" {
id = "my-first-30daysofawstf-s3bucket"
~ tags = {
"Environment" = "Dev"
~ "Name" = "My_Bucket" -> "My_Bucket 2.0"
}
~ tags_all = {
~ "Name" = "My_Bucket" -> "My_Bucket 2.0" # (1 unchanged element hidden)
} # (13 unchanged attributes hidden)

        # (3 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

 terraform destroy  
aws_s3_bucket.first_bucket: Refreshing state... [id=my-first-30daysofawstf-s3bucket]

Terraform used the selected providers to generate the following execution plan.  
Resource actions are indicated with the following symbols:

- destroy

Terraform will perform the following actions:

# aws_s3_bucket.first_bucket will be destroyed

- resource "aws_s3_bucket" "first_bucket" {
  - arn = "arn:aws:s3:::my-first-30daysofawstf-s3bucket" -> null
  - bucket = "my-first-30daysofawstf-s3bucket" -> null
  - bucket_domain_name = "my-first-30daysofawstf-s3bucket.s3.amazonaws.com" -> null
  - bucket_region = "ap-south-1" -> null
  - bucket_regional_domain_name = "my-first-30daysofawstf-s3bucket.s3.ap-south-1.amazonaws.com" -> null
  - force_destroy = false -> null
  - hosted_zone_id = "Z11RGJOFQNVJUP" -> null
  - id = "my-first-30daysofawstf-s3bucket" -> null
  - object_lock_enabled = false -> null
  - region = "ap-south-1" -> null
  - request_payer = "BucketOwner" -> null
  - tags = {
    - "Environment" = "Dev"
    - "Name" = "My_Bucket"
      } -> null
  - tags_all = {
    - "Environment" = "Dev"
    - "Name" = "My_Bucket"
      } -> null

    # (3 unchanged attributes hidden)

  - grant {
    - id = "....id" -> null
    - permissions = [
      - "FULL_CONTROL",
        ] -> null
    - type = "CanonicalUser" -> null # (1 unchanged attribute hidden)
      }

  - server_side_encryption_configuration {
    - rule { - bucket_key_enabled = false -> null

            - apply_server_side_encryption_by_default {
                - sse_algorithm     = "AES256" -> null
                  # (1 unchanged attribute hidden)
              }
          }

      }

  - versioning { - enabled = false -> null - mfa_delete = false -> null
    }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
Terraform will destroy all your managed infrastructure, as shown above.
There is no undo. Only 'yes' will be accepted to confirm.

Enter a value:
