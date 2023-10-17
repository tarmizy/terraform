terraform {
  required_providers {
    uptimerobot = {
      source = "vexxhost/uptimerobot"
      version = "0.8.2"
    }
  }
}
provider "uptimerobot" {
  api_key = var.uptimerobot_api_key
}