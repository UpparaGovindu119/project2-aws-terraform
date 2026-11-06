# 1. Create SNS Topic for CloudWatch Alerts
resource "aws_sns_topic" "alerts" {
  name = "${var.environment}-cpu-alerts-topic"
}

# 2. Subscribe your Email to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "upparagovindu119@gmail.com" # <-- Replace with your email ID
}