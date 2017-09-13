data "aws_vpc" "aws_dmz_vpc" {
  id = "${var.vpc_id}"
}


resource "aws_route_table_association" "aws-dmz_public_subnet_association" {
  subnet_id = "${var.public_subnetid_1}"
  route_table_id = "${var.public_route_table}"
}
