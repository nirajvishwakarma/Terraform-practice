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

# Provider Block

provider "aws" {
  region 	= "us-east-1"
  profile	= "default"




/*
  # Static Credentials
  access_key	= "SDHSJFHERHGSHQWOWNDDU"
  secret_key	= "dshgfhghdakqwgewqdhwidjksasadlkshfljs"
*/
}

/*
Note-1: AWS Credentials Profile (profile = "default" ) configured on your local desktop terminal $HOME/.aws/crdentials
*/
