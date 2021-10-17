region = "cn-north-1"

availability_zones = ["cn-north-1a"]

namespace = "cn-ec2-dataplat"

stage = "prod"

name = "redshift-cluster"

port = 5439

admin_user = "admin"

admin_password = "Admin_Password_1"

vpc_default_security_group_id = "sg-059"

subnet_ids = ["subnet-0cae2"]

vpc_id = "vpc-03ca"

redshift_endpoint = ["redshift.cn-north-1.amazonaws.com","redshift.amazonaws.com", "redshift.cn-northwest-1.amazonaws.com"]
