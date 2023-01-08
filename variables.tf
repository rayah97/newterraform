variable "instance_name" {
  type        = string
  description = "The name tag of the ec2 instance"
}
variable "instance_id" {
  type        = string
  description = "The ID of the ec2 instance"
}
output "instance_id" {
  value = aws_instance.myec2.id
}