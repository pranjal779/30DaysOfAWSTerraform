╰─ $ terraform plan
╷
│ Error: Invalid reference
│
│ on main.tf line 76, in resource "aws_s3_bucket_object" "object":
│ 76: for_each = fileset("${path.module / www}", "**/*")
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Invalid reference
│ 
│   on main.tf line 80, in resource "aws_s3_bucket_object" "object":
│   80:   source = "${path.module / www}/${each.value}"
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Invalid reference
│ 
│   on main.tf line 86, in resource "aws_s3_bucket_object" "object":
│   86:   etag = "${path.module / www}/${each.value}"
│
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Reference to undeclared resource
│
│ on main.tf line 112, in resource "aws_cloudfront_distribution" "s3_distribution":
│ 112: domain_name = aws_s3_bucket.firstbukcet.bucket_regional_domain_name
│
│ A managed resource "aws_s3_bucket" "firstbukcet" has not been declared in the root module.
╵

 terraform plan
╷
│ Error: Invalid reference
│
│ on main.tf line 76, in resource "aws_s3_object" "object":
│ 76: for_each = fileset("${path.module / www}", "**/*")
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Invalid reference
│ 
│   on main.tf line 80, in resource "aws_s3_object" "object":
│   80:   source = "${path.module / www}/${each.value}"
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Invalid reference
│ 
│   on main.tf line 86, in resource "aws_s3_object" "object":
│   86:   etag = "${path.module / www}/${each.value}"
│
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Reference to undeclared resource
│
│ on main.tf line 112, in resource "aws_cloudfront_distribution" "s3_distribution":
│ 112: domain_name = aws_s3_bucket.firstbukcet.bucket_regional_domain_name
│
│ A managed resource "aws_s3_bucket" "firstbukcet" has not been declared in the root module.

 terraform plan
╷
│ Error: Invalid reference
│
│ on main.tf line 76, in resource "aws_s3_object" "object":
│ 76: for_each = fileset("${path.module / www}", "**/*")
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Invalid reference
│ 
│   on main.tf line 80, in resource "aws_s3_object" "object":
│   80:   source = "${path.module / www}/${each.value}"
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Invalid reference
│ 
│   on main.tf line 86, in resource "aws_s3_object" "object":
│   86:   etag = "${path.module / www}/${each.value}"
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵
╷
│ Error: Reference to undeclared resource
│ 
│   on main.tf line 112, in resource "aws_cloudfront_distribution" "s3_distribution":
│  112:     domain_name = aws_s3_bucket.firstbukcet.bucket_regional_domain_name
│ 
│ A managed resource "aws_s3_bucket" "firstbukcet" has not been declared in the root module.
╵
 terraform plan
╷
│ Error: Invalid expression
│ 
│   on main.tf line 86, in resource "aws_s3_object" "object":
│   86:   etag = "${path.module/}www/${each.value}"
│
│ Expected the start of an expression, but found an invalid expression token.
╵
 terraform plan
╷
│ Error: Reference to undeclared resource
│
│ on main.tf line 112, in resource "aws_cloudfront_distribution" "s3_distribution":
│ 112: domain_name = aws_s3_bucket.firstbukcet.bucket_regional_domain_name
│
│ A managed resource "aws_s3_bucket" "firstbukcet" has not been declared in the root module.
╵

╷
│ Error: validating S3 Bucket ( techtutorialswithPiyushDay14) name: only alphanumeric characters, hyphens, periods, and underscores allowed in " techtutorialswithPiyushDay14"
│
│ with aws_s3_bucket.firstbucket,
│ on main.tf line 1, in resource "aws_s3_bucket" "firstbucket":
│ 1: resource "aws_s3_bucket" "firstbucket" {
