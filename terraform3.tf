resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "my-tf-state-bucket"
  acl    = "private"
  region = "us-east-1"
}

resource "aws_s3_bucket_object" "tf_state_file" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  key    = "path/to/my/state/file"
}

output "tf_state_bucket_id" {
  value = aws_s3_bucket.tf_state_bucket.id
}

output "tf_state_file_key" {
  value = aws_s3_bucket_object.tf_state_file.key
}

terraform {
  backend "s3" {
    bucket = var.tf_state_bucket_id
    key    = var.tf_state_file_key
    region = "us-east-1"
  }
}
