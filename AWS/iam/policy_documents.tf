# In an aws_iam_policy_document, the default effect is to allow the actions

# The following are for a Lambda Role

data "aws_iam_policy_document" "assume_lambda_role" {
  statement {
    sid     = "AssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "logging" {
  statement {
    sid = "AllowLogging"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    sid = "S3BucketAccess"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = ["arn:aws:s3:::*"]
  }
}

# data "aws_iam_policy_document" "db_access" {
#   statement {
#     sid     = "SSMParameterAccess"
#     actions = ["ssm:GetParameter"]
#     resources = [
#       data.aws_ssm_parameter.rds_user.arn,
#       data.aws_ssm_parameter.rds_pass.arn,
#       data.aws_ssm_parameter.rds_db_name.arn
#     ]
#   }
# }

data "aws_iam_policy_document" "sqs_access" {
  statement {
    sid = "SQSAccess"
    actions = [
      "sqs:SendMessage",
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage"
    ]
    resources = ["arn:aws:sqs:*:*:*"]
  }
}

data "aws_iam_policy_document" "sns_access" {
  statement {
    sid = "SNSAccess"
    actions = [
      "sns:Publish",
      "sns:Subscribe"
    ]
    resources = ["arn:aws:sns:*:*:*"]
  }
}

data "aws_iam_policy_document" "vpc_access" {
  statement {
    sid = "LambdaVPCAccessExecution"
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface"
    ]
    resources = ["*"]
  }
}

# The following are for an EC2 role

# data "aws_iam_policy_document" "invoke_lambda" {
#   statement {
#     sid     = "InvokeLambda"
#     actions = ["lambda:InvokeFunction"]
#     resources = [
#       aws_lambda_function.basic.arn
#     ]
#   }
# }

# data "aws_iam_policy" "read_ecr" {
#   name = "AmazonEC2ContainerRegistryReadOnly"
# }

# data "aws_iam_policy" "beanstalk_web_tier" {
#   name = "AWSElasticBeanstalkWebTier"
# }

# data "aws_iam_policy" "beanstalk_worker_tier" {
#   name = "AWSElasticBeanstalkWorkerTier"
# }

# data "aws_iam_policy" "ecs_access" {
#   name = "AWSElasticBeanstalkMulticontainerDocker"
# }
