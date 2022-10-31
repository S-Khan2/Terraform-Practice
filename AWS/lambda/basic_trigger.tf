resource "aws_s3_bucket_notification" "csv_created" {
  bucket = module.s3.trigger_id

  lambda_function {
    lambda_function_arn = aws_lambda_function.basic.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }
  depends_on = [
    aws_lambda_permission.bucket_invocation
  ]
}

resource "aws_lambda_permission" "bucket_invocation" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.basic.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3.trigger_arn
}
