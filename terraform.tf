provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "myec2"{ 

   ami = "ami-0b5eea76982371e91" 
   instance_type = "t2.micro"
}
resource "aws_instance" "myec2-new"{ 

   ami = "ami-0b5eea76982371e91" 
   instance_type = "t2.micro"
}
