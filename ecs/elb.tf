# Create a new load balancer
resource "aws_elb" "atlaniz-dmz-elb" {
  name               = "atlaniz-dmz-elb"
 availability_zones = ["us-west-2a"]

  //security_groups = ["${aws_security_group.load_balancers.id}"]
  //subnets = ["${var.public_subnetid_1}", "${var.public_subnetid_2}"]




  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }



  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "atlaniz-dmz-elb"
  }
}