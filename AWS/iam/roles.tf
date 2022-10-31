resource "aws_iam_role" "basic_role" {
  name               = "basic_role"
  assume_role_policy = data.aws_iam_policy_document.assume_lambda_role.json
}


resource "aws_iam_role_policy_attachment" "function_logging_policy_attachment" {
  role       = aws_iam_role.basic_role.id
  policy_arn = aws_iam_policy.function_logging_policy.arn
}
