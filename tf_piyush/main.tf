terraform {
 #terraform backend
   backend "s3" {
    bucket = "my-tf-test-shekar-bucket-101"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true



  }
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
