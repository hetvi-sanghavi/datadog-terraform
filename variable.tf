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
  global_variable = datadog_synthetics_global_variable.global_variable.id
}