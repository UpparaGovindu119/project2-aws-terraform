# 1. IAM Role for EC2
resource "aws_iam_role" "ec2_app_role" {
  name = "${var.environment}-ec2-app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.environment}-ec2-app-role"
  }
}

# 2. Attach CloudWatch Agent Policy (For CPU/RAM monitoring)
resource "aws_iam_role_policy_attachment" "cloudwatch_attach" {
  role       = aws_iam_role.ec2_app_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# 3. Attach SSM Managed Instance Core Policy (For secure shell login without .pem keys)
resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_app_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# 4. Custom Inline Policy for S3 State/App Bucket Access (Least Privilege)
resource "aws_iam_role_policy" "s3_access_policy" {
  name = "${var.environment}-s3-access-policy"
  role = aws_iam_role.ec2_app_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::govindu-terraform-state-bucket-2026",
          "arn:aws:s3:::govindu-terraform-state-bucket-2026/*"
        ]
      }
    ]
  })
}

# 5. IAM Instance Profile (Bridges IAM Role to EC2 Instance)
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.environment}-ec2-profile"
  role = aws_iam_role.ec2_app_role.name
}