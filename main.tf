# count
resource "aws_s3_bucket" "bucket_day_08_list" {
  # simplest way to create bucket
  # bucket = "day08_bucket"

  # multiple buckets:
  count  = 2 # or # count = length(var.bucket_names)
  bucket = var.bucket_names_list[count.index]

  tags = var.tags
}

# 2nd resource for sets
resource "aws_s3_bucket" "bucket_day08_set" {
  for_each = var.bucket_names_set
  # bucket   = each.value
  # alernatively we can also use each.key here:
  bucket = each.key

  tags = var.tags_sets_s3

  # adding a meta_argument - depends_on:
  depends_on = [aws_s3_bucket.bucket_day_08_list]
}


# this will produce error as long as we are using length to get the names of buckets from the sets for this block of bucket name from the variables.tf file
# # 2nd resource for sets
# resource "aws_s3_bucket" "bucket_day08_set" {
#   # for_each = length(var.bucket_names_set) # for_each is a counter and that is the lenght of areguments provided manually for bucket names is used here to get the count of items in the set and that will be used as a counter for creating the resources can also use individual var.bucket_name_set for the number of buckets or names provided in the variable.tf
#   bucket   = each.value

#   tags = var.tags_sets_s3
# }

# # there is also each.value which can be used to get the value of the current item in the set or list that is being iterated over in the for_each loop. In this case, each.value would give you the name of the bucket that is being created in each iteration of the loop. So you can use each.value instead of var.bucket_names_set[each.key] to get the bucket name directly from the set without needing to reference it by index.
# # bucket   = var.bucket_names_set[each.key] line will throw error


# initial bucke resource with list of bucket names:
# # count
# resource "aws_s3_bucket" "bucket_day_08_list" {
#   # simplest way to create bucket
#   # bucket = "day08_bucket"

#   # multiple buckets:
#   count  = 2 # or # count = length(var.bucket_names)
#   bucket = var.bucket_names_list[count.index]

#   tags = var.tags
# }
