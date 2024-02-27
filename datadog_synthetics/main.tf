resource "datadog_synthetics_test" "test" {
  name      = var.name
  type      = var.type
  subtype   = var.subtype
  status    = var.status
  message   = var.message
  locations = var.locations
  tags      = var.tags

  options_list {
    tick_every = var.tick_every
  }
}
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}
