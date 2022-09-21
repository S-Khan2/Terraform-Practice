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

resource "aws_s3_bucket" "s3_bucket" {
  # Set the globally unique bucket_name
  bucket = "tf-bucket-2834590"
}

resource "aws_s3_bucket_public_access_block" "s3_block" {
  # Apply access policy to above s3_bucket
  bucket = aws_s3_bucket.s3_bucket.id

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
