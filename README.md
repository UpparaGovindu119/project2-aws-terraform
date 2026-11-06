# AWS Infrastructure with Terraform

This project automates the provisioning of secure cloud infrastructure on AWS using Terraform, featuring a custom VPC with public and private subnets, Internet and NAT Gateways with Elastic IPs, dedicated route tables, remote state locking with DynamoDB, and automated CPU monitoring with SNS email alerts.

## Tech Stack
- Terraform
- AWS (VPC, Subnets, Internet Gateway, NAT Gateway, Elastic IP, Route Tables, EC2, IAM, S3, DynamoDB, CloudWatch, SNS)

## Infrastructure Components
- VPC & Networking: Custom VPC configured with both public and private subnets, an Internet Gateway for public traffic, and a NAT Gateway attached with an Elastic IP to safely route outbound internet traffic for private subnets, all managed through dedicated public and private route tables.
- Compute: EC2 Ubuntu Server instances deployed securely with custom security groups.
- Remote State & Locking: S3 bucket for storing Terraform remote state and a DynamoDB table configured for state locking to prevent concurrent apply conflicts.
- Monitoring & Alerts: CloudWatch alarm tracking high CPU utilization on the EC2 instances, integrated with an SNS topic to send instant email notifications.

## Project Structure
- main.tf: Core infrastructure resource definitions (VPC, Subnets, IGW, NAT Gateway, Route Tables, EC2, Security Groups)
- variables.tf: Input variables for configuration
- outputs.tf: Output values like instance public IP
- backend.tf: S3 remote backend and DynamoDB state locking setup
- cloudwatch.tf: CloudWatch metrics and CPU alarm configuration
- sns.tf: SNS topic and email notification setup
- .gitignore: Ignores local state files and provider binaries

## How to Run
1. Initialize Terraform:
   terraform init
2. Preview changes:
   terraform plan
3. Provision infrastructure:
   terraform apply
4. Destroy infrastructure:
   terraform destroy

## Author
Govindu Uppara
