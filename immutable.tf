terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}
resource "aws_vpc" "my-vpc-1" {
  cidr_block       = "12.0.0.0/16"    # "11.0.0.0/16" 
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
    Ranjani = "Devops Engineer"  # add more tags like Ranjani = "Bsc., Computer Science"
  }
}
# if you change the cidr_block and tags , simply change the values and run `terraform apply` .
# And aws does not create new vpc , only updates the existing one.
