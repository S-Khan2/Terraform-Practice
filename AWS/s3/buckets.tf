resource "aws_s3_bucket" "trigger" {
  # Set the globally unique bucket_name
  bucket = "trigger-bucket-2834590"
}

resource "aws_s3_bucket_public_access_block" "s3_block" {
  # Apply access policy to above s3_bucket
  bucket = aws_s3_bucket.trigger.id

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
