resource "datadog_monitor" "monitor" {
  name         = var.name
  type         = "metric alert"
  query        = "avg(last_5m):sum:system.cpu.idle{*} by {host} < 70"
  message      = "CPU usage is above 70% for the last 5 minutes"
  tags         = ["environment:production"]
}