variable "region" {
  description = "The AWS region to create resources in."
  default = "us-west-2"
}

variable "vpc_id" {

}

variable "private_subnetid_1" {}
variable "private_subnetid_2" {}
variable "public_subnetid_1" {}
variable "public_subnetid_2" {}

variable "public_route_table" {}

