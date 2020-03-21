
module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "alb_sg"
  description = "Security group for example usage with ALB"
  vpc_id      = "module.vpc.vpc_id"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}
module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web_sg"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "module.vpc.vpc_id"

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = "${module.alb_sg.this_security_group_id}"
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
}

module "db_sg" {
  source = "terraform-aws-modules/security-group/aws"
  name        = "db_sg"
  description = "Security group for Database"
  vpc_id      = "module.vpc.vpc_id"


  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "mysql-tcp"
      source_security_group_id = "${module.web_sg.this_security_group_id}"
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
}
