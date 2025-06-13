output "parsed_map" {
  value = local.parsed_map
}

output "retry_as_number" {
  value = local.retry_limit
}

output "region_string" {
  value = local.region_str
}

output "bool_test" {
  value = local.bool_test
}

output "converted_list" {
  value = local.value_list
}

output "converted_set" {
  value = local.value_set
}

output "converted_map" {
  value = local.value_map
}

output "sensitive_token" {
  value     = local.secured_value
  sensitive = true
}

output "exposed_token" {
  value = local.exposed_value
}

output "region_key_exists" {
  value = local.has_region_key
}

output "missing_key_exists" {
  value = local.has_missing_key
}

output "merged_config" {
  value = local.final_config
}
output "default_config" {
  value = local.config_defaults
}