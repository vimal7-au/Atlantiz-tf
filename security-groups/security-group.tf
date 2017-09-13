/**
 * Provides internal access to container ports
 */

resource "aws_security_group" "aws-dmz_sg" {
  name = "aws-atlantiz-dmz"
  description = "Container Instance Allowed Ports"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpc_id}"
  tags {
    Name = "aws-atlantiz-dmz"
  }
}


/*
data "aws_subnet" "aws-dmz_subnet_public" {
  //id = "${var.subnet_id}"
}

resource "aws_security_group" "aws-dmz_sg" {
  vpc_id = "${data.aws_subnet.aws-dmz_subnet_public.vpc_id}"

  ingress {
    cidr_blocks = ["${data.aws_subnet.aws-dmz_subnet_public.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}
*/