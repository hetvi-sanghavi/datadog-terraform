terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}


# Configure the Datadog provider
provider "datadog" {
  api_url  = "https://api.datadoghq.eu/"
  api_key    = var.api_key
  app_key    = var.app_key
}