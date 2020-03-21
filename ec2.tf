variable "ami_web" {
  description = "ID of AMI to use for the instance"
  default     = "ami-0c64dd618a49aeee8"
}

variable "ami_db" {
  description = "ID of AMI to use for the instance"
  default     = "ami-0c64dd618a49aeee8"
}
module "web1" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  instance_count = 1

  name          = "web1"
  ami           = "var.ami_web"
  key_name      = "module.ssh_key_pair_web.key_name"
  instance_type = "t2.micro"
  subnet_id     = "tolist(module.vpc.private_subnets)[0]"
  vpc_security_group_ids      = ["module.web_sg.this_security_group_id"]
  associate_public_ip_address = false

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]
}


module "web2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  instance_count = 1

  name          = "web2"
  ami           = "var.ami_web"
  key_name      = "module.ssh_key_pair_web.key_name"
  instance_type = "t2.micro"
  subnet_id     = "tolist(module.vpc.private_subnets)[1]"
  vpc_security_group_ids      = ["module.web_sg.this_security_group_id"]
  associate_public_ip_address = false

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]
}

module "db" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  instance_count = 1

  name          = "db"
  ami           = "var.ami_db"
  key_name      = "module.ssh_key_pair_db.key_name"
  instance_type = "t2.micro"
  subnet_id     = "tolist(module.vpc.private_subnets)[2]"
  vpc_security_group_ids      = ["module.db.this_security_group_id"]
  associate_public_ip_address = false

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]
}