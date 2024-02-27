variable "monitor_name" {
  type = string
}
variable "global_variable_name" {
  type = string
}
variable "global_variable_description" {
  type = string
  default = "Global Variable"
}
locals {
  global_variable_id   = datadog_synthetics_global_variable.global_variable.id
  global_variable_name = datadog_synthetics_global_variable.global_variable.name
}