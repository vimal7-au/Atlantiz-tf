provider "aws" {
  region = "us-west-2"

}


variable "region" {
  description = "The AWS region to create resources in."
  default = "us-west-2"
}

/*

module vpc {
  source = "./vpc"
  region = "us-west-2"
}
module "security-group" {
  source = "./security-groups"
  region = "us-west-2"
  vpc_id = "${module.vpc.vpc_id}"
}
module subnets {
  source = "./subnets"
  region = "us-west-2"
  vpc_id = "${module.vpc.vpc_id}"
}

module routeTables {
  source = "./route-table"
  region = "us-west-2"
  vpc_id = "${module.vpc.vpc_id}"
}

module igw {
  source = "./internet-gw"
  region = "us-west-2"
  vpc_id = "${module.vpc.vpc_id}"
}
*/
//
//module nacl {
//  source = "network-acl"
//  region = "us-west-2"
//  vpc_id = "${module.vpc.vpc_id}"
//}
/*

module association {
  source = "./route-table-associations"
  region = "us-west-2"
  vpc_id = "${module.vpc.vpc_id}"
  public_subnetid_1 = "${module.subnets.amz_subnet_public-1}}"
  public_subnetid_2 = "${module.subnets.amz_subnet_public-2}}"
  private_subnetid_1 = "${module.subnets.amz_subnet_private-1}}"
  private_subnetid_2 = "${module.subnets.amz_subnet_private-2}}"
  public_route_table = "${module.routeTables.dmz_public_route_table}}"
}*/

module ecs {
  source = "./ecs"
  source = "./ecs/templates"

 /* vpc_id = "${module.vpc.vpc_id}"
  public_subnetid_1 = "${module.subnets.amz_subnet_public-1}}"
  public_subnetid_2 = "${module.subnets.amz_subnet_public-2}}"
  private_subnetid_1 = "${module.subnets.amz_subnet_private-1}}"
  private_subnetid_2 = "${module.subnets.amz_subnet_private-2}}"*/

  vpc_id = ""
  public_subnetid_1 = ""
  public_subnetid_2 = ""
  private_subnetid_1 = ""
  private_subnetid_2 = ""
}