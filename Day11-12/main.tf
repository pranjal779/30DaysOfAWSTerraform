locals {
  formatted_replace = lower(replace(var.project_name, " ", "-"))
  tags              = merge(var.s3_11_12, var.created_tags)
  formatted_bucket_name = replace(
    replace(
      substr(lower(var.bucket_naming), 3, 63),
    " ", "-"), "!", "."
  )

  port_list = split(",", var.allowed_ports)

  sg_rules = [
    for port in local.port_list :
    {
      # Interpolation syntax
      name = "port-${port}"

      # concating it with another string inside a string
      # the we have to use variable inside the curly braces and prefix is $
      # that it can first convert this into value.
      # And then add it to port
      # This is called String Interpolation

      port        = port
      description = "Allow traffic on port ${port}"
    }
  ]

  # Lookup function 49:28
  instance_size = lookup(var.instance_size, var.environment, "t2.micro")

  all_locations = concat(var.user_location, var.default_location)
  #20:27
  unique_location = toset(local.all_locations)

  #22:48 calculate only the positive cost
  positive_cost = [for cost in var.monthly_costs : abs(cost)]

  #----------before 32:03---------------
  # maximum cost # does not work on tuple
  # max_cost = max(local.positive_cost)

  # -----------------------------------
  # max_cost = max(local.positive_cost)
  # max_cost = max(var.monthly_costs)
  # 25:45  - 27:18 (onwards min)
  # these are functions for numbers or integers. It does not work on tupples. so for this as well we have to run for loop
  # But because we have already executed the for loop and we already have the result in positive cost we don't have to do it again. 
  # we can just do max of local dot positive cost. and similarly we can do minnimum 
  # ----------------------

  # min_cost     = min(local.positive_cost)
  # total_cost   = sum(local.positive_cost)
  # average_cost = local.total_cost / length(local.positive_cost)
  # -----------------

  # # 32:03
  # max_cost = [for cost in var.monthly_costs : max(cost)]
  # min_cost = [for cost in var.monthly_costs : min(cost)]
  # total_cost = [for cost in local.positive_cost : sum(cost)]
  # average_cost = local.total_cost / length(local.positive_cost)

  # 34:22 - use spread operator - output in spreadOutput.txt
  max_cost     = max(local.positive_cost...)
  min_cost     = min(local.positive_cost...)
  total_cost   = sum(local.positive_cost)
  average_cost = local.total_cost / length(local.positive_cost)
  # 35:21 Numeric Function done


  # timestamp function 35:43
  current_timestamp = timestamp()
  format1           = formatdate("yyyyMMdd", local.current_timestamp)
  format2           = formatdate("YYYY-MM-DD", local.current_timestamp)
  timestamp_name    = "backup-${local.format1}"


  # 38:42 filehandling function
  # config_file_exists = fileexists("./config.json")
  # config_data = local.config_file_exits ? jsoncode(file("./config.jason")) : {}

}

resource "aws_s3_bucket" "day-11-12-bucket" {
  # bucket = "practice-11-12"
  bucket = local.formatted_bucket_name

  # you can use this
  # tags              = merge(var.s3_11_12, var.created_tags)

  tags = local.tags
}



# Lookup function 49:28
