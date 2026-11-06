# AWS Infrastructure with Terraform

This project automates the provisioning of secure cloud infrastructure on AWS using Terraform, featuring a custom VPC with public and private subnets, Internet and NAT Gateways with Elastic IPs, dedicated route tables, secure IAM roles and policies for service-to-service access without hardcoded .pem keys, remote state locking with DynamoDB, and automated CPU monitoring with SNS email alerts.

## Tech Stack
- Terraform
- AWS (VPC, Subnets, Internet Gateway, NAT Gateway, Elastic IP, Route Tables, EC2, IAM Roles & Policies, S3, DynamoDB, CloudWatch, SNS)

## Infrastructure Components
- VPC & Networking: Custom VPC configured with both public and private subnets, an Internet Gateway for public traffic, and a NAT Gateway attached with an Elastic IP to safely route outbound internet traffic for private subnets, all managed through dedicated public and private route tables.
- Compute & IAM: EC2 Ubuntu Server instances secured with custom security groups and attached IAM roles/policies, allowing secure access between AWS services without needing hardcoded .pem keys.
- Remote State & Locking: S3 bucket for storing Terraform remote state and a DynamoDB table configured for state locking to prevent concurrent apply conflicts.
- Monitoring & Alerts: CloudWatch alarm tracking high CPU utilization on the EC2 instances, integrated with an SNS topic to send instant email notifications.

## Project Structure
- main.tf: Core infrastructure resource definitions (VPC, Subnets, IGW, NAT Gateway, Route Tables, EC2, Security Groups, IAM Roles)
- variables.tf: Input variables for configuration
- outputs.tf: Output values like instance public IP
- backend.tf: S3 remote backend and DynamoDB state locking setup
- cloudwatch.tf: CloudWatch metrics and CPU alarm configuration
- sns.tf: SNS topic and email notification setup
- .gitignore: Ignores local state files and provider binaries

## How to Run & Validate
1. Initialize Terraform:
   terraform init
2. Validate configuration syntax:
   terraform validate
3. Preview changes:
   terraform plan
4. Provision infrastructure:
   terraform apply
5. Destroy infrastructure:
   terraform destroy

## Author
Govindu Uppara
