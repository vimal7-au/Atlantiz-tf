resource "aws_network_acl" "aws_public_nacl_dmz" {
  vpc_id = "${var.vpc_id}"

  ingress = {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  ingress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  ingress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  ingress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }

  egress = {
    protocol = "all"
    rule_no = 100
    action = "allow"
    cidr_block =  "10.0.0.0/26"
    from_port = 0
    to_port = 0
  }

  egress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  egress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  egress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }
}

resource "aws_network_acl" "aws_private_nacl_dmz" {
  vpc_id = "${var.vpc_id}"

  ingress = {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  ingress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  ingress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  ingress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }

  egress = {
    protocol = "all"
    rule_no = 100
    action = "allow"
    cidr_block =  "10.0.0.0/26"
    from_port = 0
    to_port = 0
  }

  egress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  egress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  egress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }
}