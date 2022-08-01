# Create EC2 Instance
#  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "my-ec2-vm" {
  ami               = ""
  instance_type     = ""
  availability_zone = "us-east-1a"
  #availability_zone	= "us-east-1b"
  tags = {
    "Name" = "web"
    #"tag1"	= "update-test-1"
  }
}
