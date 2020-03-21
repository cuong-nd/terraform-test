module "ssh_key_pair_web" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace             = "eg"
  stage                 = "prod"
  name                  = "web"
  ssh_public_key_path   = "secrets"
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}

module "ssh_key_pair_db" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace             = "eg"
  stage                 = "prod"
  name                  = "db"
  ssh_public_key_path   = "secrets"
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}