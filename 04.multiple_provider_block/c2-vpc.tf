# Resource Block
# Resource-1: Create VPC in us-eat-1 which is default provider

resource "aws_vpc" "vpc-us-east-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name"	= "vpc-us-east-1"
  }
}
