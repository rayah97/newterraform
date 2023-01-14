 provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "my-tf-state-bucket"
  acl    = "private"
  region = "us-east-1"
}

resource "aws_s3_bucket_object" "tf_state_file" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  key    = "develop/"
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
output "tf_state_bucket_id" {
  value = aws_s3_bucket.tf_state_bucket.id
}

output "tf_state_file_key" {
  value = aws_s3_bucket_object.tf_state_file.key
}

terraform {
  backend "s3" {
    bucket = aws_s3_bucket.tf_state_bucket.id
    key    = aws_s3_bucket_object.tf_state_file.key
    region = "us-east-1"
  }
}