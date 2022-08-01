# Resource Block to create VPC in us-west-1

resource "aws_vpc" "vpc-us-west-1" {
  cidr_block 	= "10.0.0.0/16"
  provider	= aws.aws-west-1
  tags	= {
    "Name"	= "vpc-us-west-1"
  }
}


/*
 Additional Notes:
provider = <PROVIDER NAME>.<ALIAS>	# This is a meta argument from Resource section nothing but a special argument
*/
