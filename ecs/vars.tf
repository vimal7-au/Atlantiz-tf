
variable "application_name" {
  default = "Atlantiz"
}

variable "iam_instance_profile" {
  description = "The ARN of the instance profile for cluster nodes"
  default="arn:aws:iam::934903335876:role/AtlantizECSServiceRole"
}
variable "user_data" {
  default = ""
}
variable "vpc_id" {

}
variable "docker_storage_size" {
  default     = "22"
  description = "EBS Volume size in Gib that the ECS Instance uses for Docker images and metadata "
}
variable "private_subnetid_1" {}
variable "private_subnetid_2" {}
variable "public_subnetid_1" {}
variable "public_subnetid_2" {}
variable "name_prefix" {
  default = ""
}
variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
  default = ""
}
variable "name" {
  description = "AWS ECS Cluster Name"
  default = "Atlantiz"
}