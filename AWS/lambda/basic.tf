data "archive_file" "zip" {
  type        = "zip"
  source_file = "./src/lambda.py"
  output_path = "./src/lambda.zip"
}

resource "aws_lambda_function" "basic" {
  function_name = "basic_lambda"

  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  role    = module.iam.basic_role_arn
  handler = "lambda.lambda_handler"
  runtime = "python3.8"
}

resource "aws_cloudwatch_log_group" "basic_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.basic.function_name}"
  retention_in_days = 7
  lifecycle {
    prevent_destroy = false
  }
}
