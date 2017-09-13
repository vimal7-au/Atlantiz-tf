
resource "aws_internet_gateway" "aws_dmz_igw" {
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "InternetGateway"
  }
}
