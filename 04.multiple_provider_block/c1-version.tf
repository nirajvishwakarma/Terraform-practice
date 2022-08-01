# Terraform Block

terraform {
  required_version = "~> 1.2.5"
  required_providers {
    aws	= {
      source	= "hashicorp/aws"
      version	= "~> 3.0"
    }
  }
}

# Providers-1 Block us-east-1 (Default Provider)

provider "aws" {
  region 	= "us-east-1"
  profile	= "default"

}

# Provider-2 for us-west-1
provider "aws" {
  region	= "us-west-1"
  profile	= "default"
  alias		= "aws-west-1"
}

/*
Note-1: AWS Credentials Profile (profile = "default" ) configured on your local desktop terminal $HOME/.aws/crdentials
*/



