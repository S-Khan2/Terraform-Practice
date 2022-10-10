# Setting up Terraform
## Installation
Use a package manager such as `homebrew` or `chocolatey` to install Terraform 

## AWS IAM User for Terraform
- Create a new `IAM User` for Terraform with `programmatic access`.
- Attach relevant policies, e.g. the existing AWS managed `AdministratorAccess` policy
- Once created, new `aws_access_key_id` and `aws_secret_access_key` will be provided.
- Store these credentials in the `.aws/credentials` file:
  ```
  [terraform-profile]
  aws_access_key_id = ...
  aws_secret_access_key = ...
  ```

## Setting the Requirements in Terraform
To specify which resource providers we'll need and what version of Terraform is needed, insert the following block in the `main.tf` file:
```py
terraform {
  # The resource providers that are needed
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31"
    }
  }
  # Required version of Terraform to manage resources
  required_version = ">= 1.2.0"
}
```

## Using this AWS profile in Terraform
In the `main.tf` file, insert the following block:
```py
provider "aws" {
  # Set profile with access_key_id and secret_key
  profile = "terraform-profile"
  # Set the default region (as string)
  region  = ... 
}
```

# Some of the basic commands
```
terraform init
```
This is the most important command, to ensure that we have all the necessary resource providers.

```
terraform fmt
```
This will format the Terraform files in the standard human-readable format

```
terraform validate
```

```
terraform plan
```

```
terraform apply
```

```
terraform apply -auto-approve
```
## 
