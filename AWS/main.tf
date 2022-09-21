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

data "archive_file" "zip" {
  type        = "zip"
  source_file = "src/lambda.py"
  output_path = "lambda.zip"
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_policy.json
}

resource "aws_lambda_function" "lambda" {
  function_name = "basic_lambda"

  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  role    = aws_iam_role.lambda_role.arn
  handler = "lambda.lambda_handler"
  runtime = "python3.8"
}
