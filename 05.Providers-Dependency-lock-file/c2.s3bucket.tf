# Resource Block: Create Random Pet Name

resource "random_pet" "petname" {
  length	= 5
  separator	= "-"
}

resource "aws_s3_bucket" "sample"{
  bucket	= random_pet.petname.id
#  acl		= "public_read"
#  region	= "us-east-1"  # comment this if we are going to use AWS Provider v3.xversion
}
