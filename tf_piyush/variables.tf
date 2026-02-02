variable "environment" {
   description = "environmet type"
   type = string
   default = "Dev"
}

variable "region" {
    description = "aws region"
    type = list(string)
    default = ["us-east-1" ,"us-east-2","us-west-1"]
      
}

variable "instance_type" {
    description = "type of disk"
    type = list(string)
    default = [ "t2.micro","t2.small","t2.medium" ]
}

#Number type
variable "instance_count" {
    type = number
    description = "no of ec2 instance to create"
    default = 1
}

#Bool type
variable "enable_monitoring" {
    type = bool
    description = "enable monitoring for ec2 instance"
    default = true
  
}
variable "associate_public_ip_address" {
   type = bool
   description = "associate public address"
   default = true
}