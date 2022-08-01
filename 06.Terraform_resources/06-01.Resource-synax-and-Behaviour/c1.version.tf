# Terraform Settings Block
terraform {
  required_version = "~>1.2.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0.0"
    }
  }
}

# Providers Block

provider "aws" {
  #region = "us-east-1"
  region = "us-west-1"
}
