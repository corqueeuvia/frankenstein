resource "datadog_monitor" "foo2" {
  name               = "Name for monitor foo2"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @hipchat-channel"
  escalation_message = "Escalation message @pagerduty"

  query = "avg(last_1h):avg:aws.ec2.cpu{environment:foo,host:foo2} by {host} > 4"

  monitor_thresholds {
    warning  = 2
    critical = 4
  }

  include_tags = true

  tags = ["foo:bar", "team:fooBar2"]
}
