provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = "~> 1.0.6"

  backend "s3" {
    bucket  = "xxxxxxxxxx"
    key     = "private-subnet-ssh"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
