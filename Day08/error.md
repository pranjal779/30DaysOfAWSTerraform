# 2nd resource for sets

resource "aws_s3_bucket" "bucket_day08_set" {
for_each = length(var.bucket_names_set) # for_each is a counter and that is wise lenght is used here to get the count of items in the set and that will be used as a counter for creating the resources can also use individual var.bucket_name_set for the number of buckets or names provided in the variable.tf
bucket = var.bucket_names_set[each.key]

tags = var.tags_sets_s3
}

╷  
│ Error: Invalid for_each argument  
│
│ on main.tf line 16, in resource "aws_s3_bucket" "bucket_day08_set":
│ 16: for_each = length(var.bucket_names_set) # for_each is a counter and that is wise lenght is used here to get the count of items in the set and that will be used as a counter for creating the resources can also use individual var.bucket_name_set for the number of buckets or names provided in the variable.tf
│ ├────────────────
│ │ var.bucket_names_set is a set of string
│
│ The given "for_each" argument value is unsuitable: the "for_each" argument must be a map, or set of strings, and you have provided a value of type number.
╵
╷
│ Error: Invalid index
│
│ on main.tf line 17, in resource "aws_s3_bucket" "bucket_day08_set":
│ 17: bucket = var.bucket_names_set[each.key]
│ ├────────────────
│ │ each.key is a string
│ │ var.bucket_names_set is a set of string
│
│ Elements of a set are identified only by their value and don't have any separate index or key to select with, so it's only possible to perform operations  
│ across all elements of the set.

you get the following error if you remove the var,bucket..... from line 17

# 2nd resource for sets

resource "aws_s3_bucket" "bucket_day08_set" {
for_each = length(var.bucket_names_set) # for_each is a counter and that is the lenght of areguments provided manually for bucket names is used here to get the count of items in the set and that will be used as a counter for creating the resources can also use individual var.bucket_name_set for the number of buckets or names provided in the variable.tf
bucket = each.key

tags = var.tags_sets_s3

 terraform plan
╷  
│ Error: Invalid for_each argument  
│  
│ on main.tf line 16, in resource "aws_s3_bucket" "bucket_day08_set":
│ 16: for_each = length(var.bucket_names_set) # for_each is a counter and that is the lenght of areguments provided manually for bucket names is used here to get the count of items in the set and that will be used as a counter for creating the resources can also use individual var.bucket_name_set for the number of buckets or names provided in the variable.tf
│ ├────────────────
│ │ var.bucket_names_set is a set of string
│
│ The given "for_each" argument value is unsuitable: the "for_each" argument must be a map, or set of strings, and you have provided a value of type number.  
╵


# 2nd resource for sets
resource "aws_s3_bucket" "bucket_day08_set" {
  for_each = length(var.bucket_names_set) 
  bucket   = each.value

  tags = var.tags_sets_s3

 terraform plan
╷  
│ Error: Invalid for_each argument  
│  
│ on main.tf line 16, in resource "aws_s3_bucket" "bucket_day08_set":
│ 16: for_each = length(var.bucket_names_set) # for_each is a counter and that is the lenght of areguments provided manually for bucket names is used here to get the count of items in the set and that will be used as a counter for creating the resources can also use individual var.bucket_name_set for the number of buckets or names provided in the variable.tf
│ ├────────────────
│ │ var.bucket_names_set is a set of string
│
│ The given "for_each" argument value is unsuitable: the "for_each" argument must be a map, or set of strings, and you have provided a value of type number.  
╵

### the following resolves the issue
# 2nd resource for sets
resource "aws_s3_bucket" "bucket_day08_set" {
  for_each = var.bucket_names_set
  bucket   = each.value

  tags = var.tags_sets_s3
}
