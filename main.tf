provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "helpshift-dataplat-terraform"
    key    = "v1/redshift"
    region = "cn-north-1"
  }
}


resource "aws_security_group" "redshift_connection" {
  egress {
    from_port = var.port
    protocol = "all"
    to_port = var.port
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = var.port
    protocol = "all"
    to_port = var.port
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${var.vpc_id}"
}


module "redshift_cluster" {
  source = "/mnt/terraform/cloudposse/terraform-aws-redshift-cluster"

  subnet_ids          =  "${var.subnet_ids}"
  vpc_security_groups = ["${var.vpc_default_security_group_id}", "${aws_security_group.redshift_connection.id}"]

  admin_user     = var.admin_user
  admin_password = var.admin_password
  iam_roles = ["${aws_iam_role.redshift_role.arn}"]

  context = module.this.context
}
