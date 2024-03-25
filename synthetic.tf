resource "datadog_synthetics_test" "synthetics_test" {
  name    = var.datadog_synthetics_test_name
  type    = "api"
  subtype = "http"
  status  = "live"
  message = <<-EOT
${var.datadog_synthetics_test_name} is currently {{#is_alert}}DOWN{{/is_alert}} {{#is_recovery}}UP{{/is_recovery}}

{{#is_alert}} Please review this runbook https://inductiveautomation.atlassian.net/wiki/home {{/is_alert}}



{{#is_recovery}}Please contact Help Desk to ensure the Statuspage has been updated with basic details and tickets are created for retrospective review {{/is_recovery}}



@component+d5fac381-f1f3-4211-acb1-9bd4cfb62271@notifications.statuspage.io

@slack-it-alerts <!subteam^S01U2TV9K0T>  @slack-website-alerts

@pagerduty-Production_Websites_Notifications_-_Datadog\
EOT

  locations = ["aws:us-east-2", "aws:us-west-2"]
  tags      = ["production", "site:${var.datadog_synthetics_test_name}", "env:${var.datadog_synthetics_test_name}"]

  request_definition {
    method = "GET"
    url    = var.datadog_synthetics_test_name
  }

  request_headers = {
    Name = "Value"
  }

  assertion {
    type     = "statusCode"
    operator = "is"
    target   = "200"
  }

  assertion {
    type     = "header"
    property = "content-type"
    operator = "is"
    target   = "text/html; charset="
  }
  options_list {
    tick_every           = 60
    http_version         = "http1"
    min_failure_duration = 600
    retry {
      count    = 2
      interval = 300
    }
    monitor_options {
      renotify_interval = 120
    }
  }
}
