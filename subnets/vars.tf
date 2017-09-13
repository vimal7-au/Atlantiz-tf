variable "region" {
  description = "The AWS region to create resources in."
  default = "us-west-2"
}
variable "cidr" {
  description = "The AWS cidr block."
  default = "10.0.0.0/16"
}
variable "vpc_id" {

}
