resource "datadog_monitor" "cpumonitor" {
  name    = var.monitor_name
  type    = "metric alert"
  message = "CPU usage alert"
  query   = "avg(last_1m):avg:system.cpu.system{*} by {host} > 60"
  monitor_thresholds = {
    ok       = 20
    warning  = 50
    critical = 60
  }
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