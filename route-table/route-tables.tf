


resource "aws_route_table" "aws-dmz_private_route_table" {
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "aws-dmz private route table"
  }
}


resource "aws_route_table" "aws-dmz_public_route_table" {
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "aws-dmz public route table"
  }
}


output "dmz_public_route_table" {
  value = "${aws_route_table.aws-dmz_public_route_table.id}"
}

