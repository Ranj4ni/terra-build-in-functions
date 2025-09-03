# create provider
provider "aws" {
  region = "us-east-1"
}
  # creation of variable
  variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"  # default = "prod"
} 
  # associate default variable names 
  variable "ec2_names"{
  default = ["abi", "nisha", "ranjani"]
}
# Create EC2 Instance
resource "aws_instance" "web" {
  #for_each      = toset(var.ec2_names)
  count         = 2
  ami           = "ami-0360c520857e3138f" # Amazon Linux 2 AMI
  instance_type = var.environment == "prod" ? "t3.medium" : "t2.micro"
  subnet_id     = "subnet-0caf83ba7ab832cd4"
  key_name      = "linux"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-0c21fa017a8f60438"]
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
  }

  tags = {
    Name =  upper("dev-${count.index + 1}")               # Name = each.value to for_each
    Environment = var.environment                          # it gives uppercase names for ec2 like, DEV-1 .
  }
}
