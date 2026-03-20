# 8/30 - AWS Terraform Meta Arguments Made EASY | Count, depends_on , for_each

## [Meta-arguments](https://developer.hashicorp.com/terraform/language/meta-arguments)

```sh
 terraform plan | grep "will be created"
grep: The term 'grep' is not recognized as a name of a cmdlet, function, script file, or executable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
 terraform plan | Select-String "will be created"

  # aws_s3_bucket.bucket_day08_set["01bucket-set-day08"] will be created
  # aws_s3_bucket.bucket_day08_set["02-day08bucket-set"] will be created
  # aws_s3_bucket.bucket_day08_set["03-bucket-set-day08"] will be created
  # aws_s3_bucket.bucket_day_08[0] will be created
  # aws_s3_bucket.bucket_day_08[1] will be created


```

### final output:

```sh
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

```
