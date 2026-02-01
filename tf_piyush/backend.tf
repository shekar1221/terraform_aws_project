terraform{

backend "s3" {
    bucket = "my-tf-test-shekar-bucket-101"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true


  }
}