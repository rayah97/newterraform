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
  key    = "path/to/my/state/file"
}

terraform {
  backend "s3" {
    bucket = aws_s3_bucket.tf_state_bucket.id
    key    = aws_s3_bucket_object.tf_state_file.key
    region = "us-east-1"
  }
}
