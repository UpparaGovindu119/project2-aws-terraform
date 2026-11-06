resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.environment}-high-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1            # Reduced from 2 to 1 for faster trigger
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60             # Reduced to 1 minute
  statistic           = "Average"
  threshold           = 5              # <-- Changed threshold to 5% for easy testing

  dimensions = {
    InstanceId = aws_instance.web_server.id
  }

  alarm_description = "Test alarm triggered when CPU exceeds 5%"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}