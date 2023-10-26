locals {
  monitor = csvdecode(file("./data/monitoring.csv"))
}

resource "datadog_monitor" "testing" {
  for_each = {for monitor in local.monitor : monitor.name => monitor}
  name               = each.value.name
  type               = each.value.type
  message            = each.value.message
  escalation_message = each.value.escalation_message
  query              = each.value.query

  monitor_thresholds {
    ok       = 3
    warning  = 2
    critical = 1
  }

  notify_no_data = true

  tags = [each.value.tags, each.value.env]
}