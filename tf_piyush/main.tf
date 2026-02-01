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
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

#create s3 bucket
resource "aws_s3_bucket" "tf_test_shekar_bucket" {
   bucket = "my-tf-test-shekar-bucket-101"

   tags = {
     Name = "My bucket"
     Environment = "Dev"
   }
}

#create ami ubuntu
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}