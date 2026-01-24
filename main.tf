terraform {
  required_providers {
    aws = {
        source = "registry.terraform.io/hashicorp/aws"
        }
}
}
provider "aws" {

        region = "us-east-1"
}

resource "aws_key_pair" "linux_tf_key" {
       key_name = "linux-terraform-ec2-keypair"
       public_key = file("~/.ssh/id_rsa.pub")
     }
resource "aws_instance" "lab_ec2" {
        ami = "ami-0532be01f26a3de55" #amazon-linux-ami
        instance_type = "t2.micro"
        key_name      = "linux-shekhar"
        subnet_id     = aws_subnet.my_subnet.id
        vpc_security_group_ids = [aws_security_group.sg.id]
        associate_public_ip_address = true
        tags = {
          Name  = "Terraform-EC2"
        }
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Terraform-VPC"
  }
}

# Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Terraform-Subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "Terraform-IGW"
  }
}

# Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate Route Table
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.rt.id
}

# Security Group (SSH)
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-SG"
  }
}
output "ec2_public_ip" {
  value = aws_instance.lab_ec2.public_ip
}

