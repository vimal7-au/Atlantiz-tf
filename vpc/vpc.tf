resource "aws_vpc" "aws_dmz_vpc" {
  cidr_block           = "${var.cidr}"
  tags = {
    Name = "aws-atlantiz-dmz-vpc"
  }
}


output "vpc_id" {
  value = "${aws_vpc.aws_dmz_vpc.id}"
}