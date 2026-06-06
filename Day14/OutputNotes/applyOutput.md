```txt
 terraform apply
data.aws_region.current: Reading...
aws_cloudfront_origin_access_control.origin: Refreshing state... [id=E2###@@@@###@@@@JQQ]
data.aws_region.current: Read complete after 0s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_cloudfront_distribution.s3_distribution will be created
  + resource "aws_cloudfront_distribution" "s3_distribution" {
      + arn                             = (known after apply)
      + caller_reference                = (known after apply)
      + comment                         = "Some comment"
      + continuous_deployment_policy_id = (known after apply)
      + default_root_object             = "index.html"
      + domain_name                     = (known after apply)
      + enabled                         = true
      + etag                            = (known after apply)
      + hosted_zone_id                  = (known after apply)
      + http_version                    = "http2"
      + id                              = (known after apply)
      + in_progress_validation_batches  = (known after apply)
      + is_ipv6_enabled                 = true
      + last_modified_time              = (known after apply)
      + logging_v1_enabled              = (known after apply)
      + price_class                     = "PriceClass_100"
      + retain_on_delete                = false
      + staging                         = false
      + status                          = (known after apply)
      + tags                            = {
          + "Environment" = "production"
        }
      + tags_all                        = {
          + "Environment" = "production"
        }
      + trusted_key_groups              = (known after apply)
      + trusted_signers                 = (known after apply)
      + wait_for_deployment             = true

      + default_cache_behavior {
          + allowed_methods        = [
              + "GET",
              + "HEAD",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
            ]
          + compress               = false
          + default_ttl            = 3600
          + max_ttl                = 86400
          + min_ttl                = 0
          + target_origin_id       = (known after apply)
          + trusted_key_groups     = (known after apply)
          + trusted_signers        = (known after apply)
          + viewer_protocol_policy = "redirect-to-https"

          + forwarded_values {
              + headers                 = (known after apply)
              + query_string            = false
              + query_string_cache_keys = (known after apply)

              + cookies {
                  + forward           = "none"
                  + whitelisted_names = (known after apply)
                }
            }

          + grpc_config (known after apply)
        }

      + logging_config {
          + bucket          = "mylogs.s3.amazonaws.com"
          + include_cookies = false
          + prefix          = "myprefix"
        }

      + origin {
          + connection_attempts         = 3
          + connection_timeout          = 10
          + domain_name                 = (known after apply)
          + origin_id                   = (known after apply)
          + response_completion_timeout = (known after apply)
            # (2 unchanged attributes hidden)

          + s3_origin_config {
              + origin_access_identity = "origin-access-identity/cloudfront/AB###@@@@###@@@@4567"
            }
        }

      + restrictions {
          + geo_restriction {
              + locations        = (known after apply)
              + restriction_type = "none"
            }
        }

      + viewer_certificate {
          + cloudfront_default_certificate = true
          + minimum_protocol_version       = "TLSv1"
        }
    }

  # aws_s3_bucket.firstbucket will be created
  + resource "aws_s3_bucket" "firstbucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = " techtutorialswithPiyush"
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
      + tags_all                    = (known after apply)
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

  # aws_s3_bucket_policy.allow_cloudfront will be created
  + resource "aws_s3_bucket_policy" "allow_cloudfront" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + policy = (known after apply)
      + region = "us-east-1"
    }

  # aws_s3_bucket_public_access_block.block will be created
  + resource "aws_s3_bucket_public_access_block" "block" {
      + block_public_acls       = true
      + block_public_policy     = true
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = true
      + region                  = "us-east-1"
      + restrict_public_buckets = true
    }

  # aws_s3_object.object["Index.html"] will be created
  + resource "aws_s3_object" "object" {
      + acl                    = (known after apply)
      + arn                    = (known after apply)
      + bucket                 = (known after apply)
      + bucket_key_enabled     = (known after apply)
      + checksum_crc32         = (known after apply)
      + checksum_crc32c        = (known after apply)
      + checksum_crc64nvme     = (known after apply)
      + checksum_sha1          = (known after apply)
      + checksum_sha256        = (known after apply)
      + content_type           = "text/html"
      + etag                   = "84ce5###@@@@1872630dc1be4"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "Index.html"
      + kms_key_id             = (known after apply)
      + region                 = "us-east-1"
      + server_side_encryption = (known after apply)
      + source                 = "./www/Index.html"
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_object.object["script.js"] will be created
  + resource "aws_s3_object" "object" {
      + acl                    = (known after apply)
      + arn                    = (known after apply)
      + bucket                 = (known after apply)
      + bucket_key_enabled     = (known after apply)
      + checksum_crc32         = (known after apply)
      + checksum_crc32c        = (known after apply)
      + checksum_crc64nvme     = (known after apply)
      + checksum_sha1          = (known after apply)
      + checksum_sha256        = (known after apply)
      + content_type           = "application/javascript"
      + etag                   = "2addc###@@@@###@@@@e1476c04d4c31"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "script.js"
      + kms_key_id             = (known after apply)
      + region                 = "us-east-1"
      + server_side_encryption = (known after apply)
      + source                 = "./www/script.js"
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_object.object["style.css"] will be created
  + resource "aws_s3_object" "object" {
      + acl                    = (known after apply)
      + arn                    = (known after apply)
      + bucket                 = (known after apply)
      + bucket_key_enabled     = (known after apply)
      + checksum_crc32         = (known after apply)
      + checksum_crc32c        = (known after apply)
      + checksum_crc64nvme     = (known after apply)
      + checksum_sha1          = (known after apply)
      + checksum_sha256        = (known after apply)
      + content_type           = "text/css"
      + etag                   = "7c44fb###@@@@###@@@@f889a###@@@@###@@@@9a2d"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "style.css"
      + kms_key_id             = (known after apply)
      + region                 = "us-east-1"
      + server_side_encryption = (known after apply)
      + source                 = "./www/style.css"
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:

```
