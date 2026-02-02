locals {
    #common tags to all resoruces
    common_tags {
      Environment = var.environment
      ManagedBy = "Terraform"
      LOB = "Engineering"
      Stage = "Alpha"
      
    }
#Instance config
instance_name = "${var.environment}-instance"



}