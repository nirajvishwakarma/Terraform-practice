#############################################################
# Block-1: Terraform Settings block
terraform {
  required_version = "~>014"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = " ~> 3.0"
    }
  }
  # Adding Backend as s3 for remote State Storage with State locking
  backend "s3" {
    bucket = "terraform-stacksimplify"
    key    = "dev2/terraform.tfstate"
    region = "us-east-1"

    # for state locking
    dynamodb_table =  "terraform-dev-state-table"

  }


}

###########################################################
# Block-2: provider Block
provider "aws" {
  profile = "default"  // AWS Credentials profile configured on your local desktop terminal $HOME/.aws/crdentials
  region  = "us-east-1"
}

###########################################################
# Block-3: Resource Block

resource " aws_instance" "ec2demo" {
  ami		= "ami-04d29b6f966df1537" // Amazon Linux
  instance_type = var.instance_type
}

###########################################################
# Block-4: Input Variable Block
variable " instance_type" {
  default = "t2.micro"
  description = "EC2 Instance Type"
  type = string
}

############################################################
#Block-5: Output Values Block 

output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value	      =  aws_instance.my-ec2-vm.public_ip
}

###########################################################
#Block-6: Local Values Block

# Create s3 Bucket - with Input Variable & Local Values

locals {
  bucket-name-prefix = "${var.app_name}-${var,environment_name}"
}

##########################################################
#Block-7: Data Source Block
# Get latest AMI ID for amazon Linux2 .OS

data "aws_ami" "amzlinux" {
  most_recent	= true
  owners	= [""amazon]
  
  filter {
    name	= "name"
    values	= ["amzn2-ami-hvm-*"]
  }

  filter {
    name	= "root-device-type"
    values	["ebs"]
  }

  filter {
    name	= " virtualization-type"
    values	= ["hvm"]
  }
  
  filter {
    name	= "architecture"
    values	= ["x86_64"]
  }

}


############################################################
# Block-8: Modules Block
# AWS ec2 Instance Module

module "ec2_cluster" {
  source		= "terraform-aws-modules/ec2-instance/aws"
  version		= "~> 2.0"
  
  name			"my-module-demo"
  instance_count	= 2

  ami			= data.aws_am  
  name			"my-module-demo"
  instance_count	= 2

  ami			= data.aws_ami.amzlinux.id
  instance_type		= "t2.micro"
  key_name		= "terraform-key"
  monitoring		= true
  vpc_security_group_ids= ["sg-08b25c5a5bf4489ffa"]	// Get default VPC security Group ID and Replace
  subnet_id		= "subnet-4ee95470"	// Get one public subnet id from default vpc and replace
  user_data		= file("apache-install.sh")

  tag = {
    Terraform	= "true"
    Environment	= "dev"
  }
  
}

##############################################################
