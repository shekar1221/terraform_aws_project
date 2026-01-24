terraform {
  required_providers {
    aws = {
        source = "registry.terraform.io/hashicorp/aws"
        }
}
}


resource "aws_key_pair" "linux_tf_key" {
       key_name = "linux-terraform-ec2-keypair"
       public_key = file("~/.ssh/id_rsa.pub")
     }


