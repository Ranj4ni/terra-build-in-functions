provider "aws" {
  region = "us-west-1"
}
# associate s3 & dynamodb for backend
terraform {
  backend "s3" {
    bucket         = "terra-state-bucket-remote1"
    key            = "Ranjani/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "arul-table"
  }
}

# S3 bucket for storing Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terra-state-bucket-remote1"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "arul-table"                # Dynamodb will be generate lockid
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "s"
  }
}
