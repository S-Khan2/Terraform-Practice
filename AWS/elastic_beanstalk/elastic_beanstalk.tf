# resource "aws_s3_bucket" "deployment_bucket" {
#   bucket = var.deployment_bucket
# }

# resource "aws_s3_account_public_access_block" "private_s3_block" {
#   bucket = aws_s3_bucket.deployment_bucket.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "aws_s3_object" "dockerrun_object" {
#   bucket = aws_s3_bucket.deployment_bucket.id
#   key    = var.dockerrun_object
#   source = var.dockerrun_object
# }

# resource "aws_elastic_beanstalk_application" "elastic_app" {
#   name = var.elastic_app
# }

# # Under the hood, uses cloudformation to deploy the environment
# resource "aws_elastic_beanstalk_environment" "elastic_env" {
#   name                = var.elastic_env
#   application         = aws_elastic_beanstalk_application.elastic_app.name
#   solution_stack_name = var.solution_stack_name

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "IamInstanceProfile"
#     value     = "aws-elasticbeanstalk-ec2-role"
#   }
#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "InstanceType"
#     value     = "t2.micro"
#   }
#   setting {
#     namespace = "aws:autoscaling:asg"
#     name      = "MinSize"
#     value     = 1
#   }
#   setting {
#     namespace = "aws:autoscaling:asg"
#     name      = "MaxSize"
#     value     = 2
#   }
# }

# resource "aws_elastic_beanstalk_application_version" "latest" {
#   name        = "latest"
#   application = var.elastic_app
#   description = "Version latest of app ${var.elastic_app}"
#   bucket      = var.deployment_bucket
#   key         = var.dockerrun_object
# }

# aws elasticbeanstalk update-environment \
#   --application-name relocator \
#   --version-label latest \
#   --environment-name relocator-env
