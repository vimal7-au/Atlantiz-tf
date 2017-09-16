resource "aws_ecs_cluster" "atlantis_cluster" {
  name = "Atlantiz-Ecs"
}

resource "aws_ecs_task_definition" "atlantis_task_definition" {
  family                = "${var.application_name}"
  container_definitions = "${data.template_file.task_definition.rendered}"
}


resource "aws_ecs_service" "atlantis_ecs_service" {
  name            = "${var.application_name}"
  cluster         = "${aws_ecs_cluster.atlantis_cluster.name}"
  task_definition = "${aws_ecs_task_definition.atlantis_task_definition.arn}"
  desired_count   = 1
  iam_role        = "arn:aws:iam::934903335876:role/AtlantizECSServiceRole"

  load_balancer {
    container_name   = "${var.application_name}"
    container_port   = 8080

    elb_name       = "${aws_elb.atlaniz-dmz-elb.name}"
  }

}


resource "aws_launch_configuration" "ecs-lc" {
  name_prefix   = "${coalesce(var.name_prefix, "ecs-${var.name}-")}"
  key_name      = "${var.key_name}"

  image_id             = "ami-1d668865"
  instance_type        = "t2.micro"
 // security_groups      = ["${aws_security_group.ecs-sg.id}"]

  iam_instance_profile = "arn:aws:iam::934903335876:instance-profile/AtlantizECSServiceRole"
  user_data = "${coalesce(var.user_data, data.template_file.user_data.rendered)}"

  //associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "ecs" {
  name                 = "asg-${aws_launch_configuration.ecs-lc.name}"
  vpc_zone_identifier  = ["subnet-8bc7f6ec"]
  launch_configuration = "${aws_launch_configuration.ecs-lc.name}"
  min_size             = 0
  max_size             = 1
  desired_capacity     = "1"
  termination_policies = ["OldestLaunchConfiguration", "ClosestToNextInstanceHour", "Default"]




  lifecycle {
    create_before_destroy = true
  }
}


data "template_file" "task_definition" {
  template = "${file("${path.module}/templates/task_definition.tpl")}"
  vars {
    service_name  = "${var.application_name}"
      service_image = "latest"

  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.tpl")}"

  vars {
    cluster_name        = "${aws_ecs_cluster.atlantis_cluster.name}"
    docker_storage_size = "${var.docker_storage_size}"

  }
}