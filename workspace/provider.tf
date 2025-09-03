provider "aws" {
  region     = "us-west-1"
}
# create remote backend of s3
terraform {
  backend "s3" {
    bucket         = "terraform-dancing-duck"
    key            = "ranjani/terraform.tfstate"
    region        = "us-west-1"
  }
}
