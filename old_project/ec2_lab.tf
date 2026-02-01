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
