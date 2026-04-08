output "formatted_project_name" {
  value = local.formatted_project_name
}


output "formatted_replace" {
  value = local.formatted_replace
}

output "port_list" {
  value = local.port_list
}

output "sg_rules" {
  value = local.sg_rules
}


output "instance_size" {
  value = local.instance_size
}

output "credentials" {
  value     = var.credentials
  sensitive = true
}


# all locations
# 19:00
output "all_locations" {
  value = local.all_locations
}


# 21:00
output "unique_location" {
  value = local.unique_location
}

# 23:40
output "positive_cost" {
  value = local.positive_cost
}


# 36:05
output "time" {
  value = local.current_timestamp
}


#41:17
# output "config" {
#   value = local.config_data
# }
