resource "aws_s3_bucket" "firstbucket" {
  bucket = var.bucket_name
}


# [Resource: aws_s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block)

# this was implicit dependency on the resource
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.firstbucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# origin access control 13:10
# 13:30
# [Resource: aws_cloudfront_origin_access_control](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) 


resource "aws_cloudfront_origin_access_control" "origin" {
  name                              = "demo-origin"
  description                       = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# [Resource: aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)


resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket     = aws_s3_bucket.firstbucket.id
  depends_on = [aws_s3_bucket_public_access_block.block] # explicit dependency on the resource
  # option 1 call the policy
  # policy = data.aws_iam_policy_document.allow_access_from_another_account.json


  # ----------
  # https://awspolicygen.s3.amazonaws.com/policygen.html
  # at around 18:39

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowCloudFront",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudfront.amazonaws.com"
        },
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource" : "${aws_s3_bucket.firstbucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.s3_distribution.arn
          }
        }
      }
    ]
  })
}

# ----------

# 24:04
# upload the static files
# [Resource: aws_s3_bucket_object: Uploading a file to a bucket](https://registry.terraform.io/providers/hashicorp/aws/2.43.0/docs/resources/s3_bucket_object#uploading-a-file-to-a-bucket)
resource "aws_s3_object" "object" {

  for_each = fileset("${path.module}/www", "**/*")
  bucket   = aws_s3_bucket.firstbucket.id

  key    = each.value
  source = "${path.module}/www/${each.value}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = "${filemd5("${source})"}" -> my attempt
  etag = filemd5("${path.module}/www/${each.value}")

  # lookup function
  # 29:27
  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
    "json" = "applicaiton/json",
    "png"  = "image/png"
    "jpg"  = "image/jpeg",
    "jpeg" = "image/jpeg",
    "gif"  = "image/gif",
    "svg"  = "image/svg+xml",
    "ico"  = "image/x-con",
    "text" = "text/plain"

  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")

}


# 31:15
# [Resource: aws_cloudfront_distribution](https://registry.terraform.io/providers/hashicorp/aws/2.43.0/docs/resources/cloudfront_distribution)
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.firstbucket.bucket_regional_domain_name
    origin_id   = local.origin_id

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "mylogs.s3.amazonaws.com"
    prefix          = "myprefix"
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # we dont need these we have the default cache behvaiour
  # # Cache behavior with precedence 0
  # ordered_cache_behavior {
  #   path_pattern     = "/content/immutable/*"
  #   allowed_methods  = ["GET", "HEAD", "OPTIONS"]
  #   cached_methods   = ["GET", "HEAD", "OPTIONS"]
  #   target_origin_id = local.origin_id

  #   forwarded_values {
  #     query_string = false
  #     headers      = ["Origin"]

  #     cookies {
  #       forward = "none"
  #     }
  #   }

  #   min_ttl                = 0
  #   default_ttl            = 86400
  #   max_ttl                = 31536000
  #   compress               = true
  #   viewer_protocol_policy = "redirect-to-https"
  # }

  # # Cache behavior with precedence 1
  # ordered_cache_behavior {
  #   path_pattern     = "/content/*"
  #   allowed_methods  = ["GET", "HEAD", "OPTIONS"]
  #   cached_methods   = ["GET", "HEAD"]
  #   target_origin_id = local.origin_id

  #   forwarded_values {
  #     query_string = false

  #     cookies {
  #       forward = "none"
  #     }
  #   }

  #   min_ttl                = 0
  #   default_ttl            = 3600
  #   max_ttl                = 86400
  #   compress               = true
  #   viewer_protocol_policy = "redirect-to-https"
  # }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
