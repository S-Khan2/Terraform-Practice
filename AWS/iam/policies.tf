resource "aws_iam_policy" "function_logging_policy" {
  name   = "function-logging-policy"
  policy = data.aws_iam_policy_document.logging.json
}
