terraform {
   backend "s3" {
   bucket = "seun-tf-state" # replace this with a new bucket for persisting tf state
   key    = "seun/"
   region = "us-east-2"
  }
  required_version = ">= 0.15.4"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=4.4.0"
    }
     cloudinit = {
      version = ">=2.0"
      source  = "hashicorp/cloudinit"
    }
  }
}
