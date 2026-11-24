# ponytail: local Floci provider. For real AWS, replace this file with just: provider "aws" { region = var.aws_region }
provider "aws" {
  region     = var.aws_region
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    autoscaling = "http://localhost:4566"
    ec2         = "http://localhost:4566"
    eks         = "http://localhost:4566"
    iam         = "http://localhost:4566"
    kms         = "http://localhost:4566"
    logs        = "http://localhost:4566"
    s3          = "http://localhost:4566"
    ssm         = "http://localhost:4566"
    sts         = "http://localhost:4566"
  }
}
