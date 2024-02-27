resource "datadog_monitor" "cpumonitor" {
  name               =  var.monitor_name
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @hipchat-channel"
  escalation_message = "Escalation message @pagerduty"

  query = "avg(last_1h):avg:aws.ec2.cpu{environment:foo,host:foo} by {host} > 4"

  monitor_thresholds {
    warning  = 2
    critical = 4
  }

  include_tags = true

  tags = ["foo:bar", "team:fooBar"]
}

resource "datadog_dashboard" "scotchbox_dashboard" {
  title        = "Scotchbox Dashboard"
  description  = "Created using the Datadog provider in Terraform"
  layout_type  = "ordered"
  is_read_only = true

  widget {
    alert_value_definition {
      alert_id   = datadog_monitor.cpumonitor.id
      precision  = 3
      unit       = "b"
      text_align = "center"
      title      = "Host CPU Usage"
    }
  }

  widget {
    check_status_definition {
      check    = "datadog.agent.up"
      grouping = "check"
      group    = "host:scotchbox"
      title    = "Host Availability"
      time = {
        live_span = "1h"
      }
    }
  }
}