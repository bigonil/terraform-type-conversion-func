variable "input_map" {
  description = "An input that might not be a map"
  default     = "{\"region\":\"us-east-1\",\"count\":\"3\"}"
}

variable "input_sensitive" {
  description = "A sensitive string (like a secret)"
  default     = "myS3cretPa$$"
  sensitive   = true
}

variable "user_config" {
  description = "Optional object config"
  type = object({
    enable_logging = optional(bool)
    retry_limit    = optional(number)
  })
  default = {}
}

locals {
  # Try to decode the map; fallback to empty map
  parsed_map = try(jsondecode(var.input_map), {})

  # Convert values to the proper types
  retry_limit = tonumber(local.parsed_map["count"])
  region_str  = tostring(local.parsed_map["region"])
  bool_test   = tobool("true") # Simple coercion test
  value_list  = tolist(["a", "b", "b"])
  value_set   = toset(["a", "b", "b"])
  value_map   = tomap({ x = 1, y = 2 })

  # Sensitivity control
  secured_value = sensitive("token-123")
  exposed_value = nonsensitive(var.input_sensitive)

  # can() check — does this key exist safely?
  has_region_key  = can(local.parsed_map["region"])
  has_missing_key = can(local.parsed_map["not_real"])

  # defaults() usage
  config_defaults = {
    enable_logging = true
    retry_limit    = 5
  }

  final_config = merge(local.config_defaults, var.user_config)

}