terraform {
  # Where are the resources that we will be managing?
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31"
    }
  }
  # Required version of Terraform to manage resources
  required_version = ">= 1.2.0"
}

provider "aws" {
  # Set profile with access_key_id and secret_key
  profile = "terraform-profile"
  # Set the default region to London: eu-west-2
  region = "eu-west-2"
}
