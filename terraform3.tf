provider "aws" {
  region = "us-east-1"
}

variable "name" {
  default = "my-ec2-instance"
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "my-tf-state-bucket"
  acl    = "private"
  region = "us-east-1"
}

resource "aws_s3_bucket_object" "tf_state_file" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  key    = "path/to/my/state/file"
}

resource "aws_instance" "example" {
  ami           = "ami-0e73a05f4e04a71f1"
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }
}

terraform {
  backend "s3" {
    bucket = aws_s3_bucket.tf_state_bucket.id
    key    = aws_s3_bucket_object.tf_state_file.key
    region = "us-east-1"
  }
}
