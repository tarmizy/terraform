output "dashboard" {
  description = "dashboard name"
  value       = datadog_dashboard_json.dashboard_json
}
output "logs_metric" {
  description = "monitoring name"
  value       = datadog_logs_metric.testing_logs_metric
}
output "monitor" {
  description = "monitoring name"
  value       = local.monitor
}
output "user" {
  description = "user name"
  value       = datadog_user.test
}