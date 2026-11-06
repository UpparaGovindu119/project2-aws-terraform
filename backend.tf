terraform {
  backend "s3" {
    bucket       = "govindu-terraform-state-bucket-2026"
    key          = "project2/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}