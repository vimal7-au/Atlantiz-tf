
data "aws_vpc" "aws_dmz_vpc" {
  id = "${var.vpc_id}"
}


resource "aws_subnet" "aws-dmz_subnet_private-1" {
  vpc_id                  = "${data.aws_vpc.aws_dmz_vpc.id}"
  cidr_block              = "10.0.0.0/28"
  map_public_ip_on_launch = true
  tags = {
    Name =  "aws-dmz_subnet_private-1"
  }
}


resource "aws_subnet" "aws-dmz_subnet_private-2" {
  vpc_id                  = "${data.aws_vpc.aws_dmz_vpc.id}"
  cidr_block              = "10.0.0.16/28"
  map_public_ip_on_launch = true
  tags = {
    Name =  "aws-dmz_subnet_private-2"
  }
}


resource "aws_subnet" "aws-dmz_subnet_public-1" {
  vpc_id                  = "${data.aws_vpc.aws_dmz_vpc.id}"
  cidr_block              = "10.0.0.32/28"
  map_public_ip_on_launch = true
  tags = {
    Name =  "aws-dmz_subnet_public-1"
  }
}


resource "aws_subnet" "aws-dmz_subnet_public-2" {
  vpc_id                  = "${data.aws_vpc.aws_dmz_vpc.id}"
  cidr_block              = "10.0.0.48/28"
  map_public_ip_on_launch = true
  tags = {
    Name =  "aws-dmz_subnet_public-2"
  }
}



output "amz_subnet_private-1" {
  value = "${aws_subnet.aws-dmz_subnet_private-1.id}"
}


output "amz_subnet_private-2" {
  value = "${aws_subnet.aws-dmz_subnet_private-2.id}"
}


output "amz_subnet_public-1" {
  value = "${aws_subnet.aws-dmz_subnet_public-1.id}"
}

output "amz_subnet_public-2" {
  value = "${aws_subnet.aws-dmz_subnet_public-1.id}"
}

