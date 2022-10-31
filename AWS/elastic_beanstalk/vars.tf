# variable "deployment_bucket" {
#   type        = string
#   description = "Name of bucket containing Dockerrun file"
#   default     = "elastic-beanstalk-source"
# }

# variable "dockerrun_object" {
#   type        = string
#   description = "Name of Dockerrun file"
#   default     = "Dockerrun.aws.json"
# }

# variable "elastic_app" {
#   type        = string
#   description = "Name of Elastic Beanstalk application"
#   default     = "relocator"
# }

# variable "elastic_env" {
#   type        = string
#   description = "Name of Elastic Beanstalk environment"
#   default     = "relocator-env"
# }

# variable "solution_stack_name" {
#   type        = string
#   description = "Name of Docker solution stack"
#   default     = "64bit Amazon Linux 2 v3.5.0 running Docker"
# }

# aws-elasticbeanstalk-service-role
# arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth
# arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy

# aws-elasticbeanstalk-ec2-role
# arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
# arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker
# arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier
# arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier
