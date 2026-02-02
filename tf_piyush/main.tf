terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

#create ami ubuntu
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = [var.instance_type[0]]

#instance count
count = var.instance_count

#Bool type
monitoring = var.enable_monitoring
associate_public_ip_address = var.associate_public_ip_address
 
 
  tags = {
    Name = "${var.environment}-ec2-tf-instance"  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "example" {

   cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
    Environment = var.environment
  }
}


#create s3 bucket
 resource "aws_s3_bucket" "demo" {
   bucket = "my-tf-test-shekar-bucket-101"

   tags = {
     Name = "My bucket"
     Environment = var.environment
   }
} 

