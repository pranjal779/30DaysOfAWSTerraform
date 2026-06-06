[14/30 - Host A Static Website In AWS S3 And Cloudfront (using terraform)](https://www.youtube.com/watch?v=bK6RimAv2nQ&list=PLl4APkPHzsUWr5H7mprC8O21Crq_NnbYx&index=18)

[Resource: aws_s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block)

[Resource: aws_cloudfront_origin_access_control](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control)

[Resource: aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)

## Resource: aws_s3_bucket_object:

[Uploading a file to a bucket](https://registry.terraform.io/providers/hashicorp/aws/2.43.0/docs/resources/s3_bucket_object#uploading-a-file-to-a-bucket)

[Resource: aws_cloudfront_distribution](https://registry.terraform.io/providers/hashicorp/aws/2.43.0/docs/resources/cloudfront_distribution)

# 48:37

At (48:37), the creator explains that the **bucket policy** they configured was specifically scoped to the **objects** within the S3 bucket, rather than the **bucket itself**.

Here is the breakdown of why this distinction matters:

- **Resource Scope:** In the policy document, the `Resource` was defined as `arn:aws:s3:::bucket-name/*`. The trailing `/*` indicates that the permissions apply only to the **objects** inside the bucket, not the container (the bucket) itself.
- **Action Mismatch:**
  - `s3:GetObject` is an action performed on **objects** inside a bucket, which is why it works with the `/*` resource path.
  - `s3:ListBucket` is an action performed on the **bucket itself** (to see the contents). Because the policy resource was defined for objects (`/*`), applying a bucket-level action like `ListBucket` results in a **malformed policy error** (as seen at 45:00), because the operation does not apply to that specific resource path.

Essentially, to use `s3:ListBucket`, the policy would need a separate statement with the resource defined as the bucket ARN without the `/*` suffix.

[Resource: aws_cloudfront_response_headers_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy)
