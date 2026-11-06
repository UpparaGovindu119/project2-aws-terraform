variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Target AWS Region"
}

variable "environment" {
  type        = string
  default     = "production"
  description = "Environment name tag"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance size"
}
variable "key_name" {
  description = "EC2 SSH Key Pair name"
  type        = string
  default     = "dev"
}