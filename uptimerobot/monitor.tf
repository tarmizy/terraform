resource "uptimerobot_monitor" "demo_satunadi" {
  friendly_name = "Monitor Demo SatuNadi"
  type          = "http"
  url           = "https://demo.satunadi.id"
}