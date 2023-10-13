output "dashboard" {
  description = "dashboard name"
  value       = datadog_dashboard_json.dashboard_json
}
output "logs_metric" {
  description = "monitoring name"
  value       = datadog_logs_metric.testing_logs_metric
}
output "monitoring" {
  description = "monitoring name"
  value       = datadog_monitor.beacon
}
output "user" {
  description = "user name"
  value       = datadog_user.test
}