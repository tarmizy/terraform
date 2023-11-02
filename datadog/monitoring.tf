locals {
  inputs = [
    {
      base = {
        name                = "$${name}-lorem"
        type                = "$${type}"
        message             = "$${message}"
        escalation_message  = "$${escalation_message}"
        query               = "$${query}"
        tags                = "$${tags}"
        env                 = "$${env}"
      }
      default = {
        name               = "demo"
        type               = "metric alert"
        message            = "Kubernetes Pods are not in an optimal health state. Notify: @operator,Please investigate the Kubernetes Pods @operator"
        escalation_message = "Kubernetes Pods are not in an optimal health state. Notify: @operator,Please investigate the Kubernetes Pods @operator"
        query              = "max(last_1h):sum:docker.containers.running{*} <= 1"
        tags               = "apps:demo"
        env                = "env:staging"
      }
      variants = [
        {
          "name" = "c"
        },
        {
          "tags" = "d"
        },
        {
          "name" = "f"
          "tags" = "g"
        },
        {
          "name" = "z"
          "env" = "env:testing"
        }
      ]
    }
  ]
}

resource "datadog_monitor" "testing" {

  for_each = merge(flatten([
    for i, input in local.inputs : [
      for j, variant in input.variants : {
        "${i}-${j}" = {
          data     = merge(input.default, variant)
        }
      }
    ]
  ])...)
  name               = each.value.data.name
  type               = each.value.data.type
  message            = each.value.data.message
  escalation_message = each.value.data.escalation_message
  query              = each.value.data.query

  monitor_thresholds {
    ok       = 3
    warning  = 2
    critical = 1
  }

  notify_no_data = true

  tags = [each.value.data.tags, each.value.data.env]
}