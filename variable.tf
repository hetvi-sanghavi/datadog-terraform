variable "monitor_name" {
  type = string
}
locals {
  global_variable = datadog_synthetics_global_variable.global_variable.id
}