 provider "aws" {
  region = "us-east-1"
}

variable "instance_name" {
  type        = string
  description = "The name tag of the ec2 instance"
}
resource "aws_instance" "myec2" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.instance_name}"
  }
}
terraform {
  backend "s3" {
    bucket = "bucketforterraformangit"
    key    = "develop/terraform.tfstate"
    region = "us-east-1"
  }
}
