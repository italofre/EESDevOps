provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"
  ami               = var.ami
  db_password       = var.db_password
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = var.ec2_security_group_id
  subnet_id         = var.ec2_subnet_id
  vpc_id            = var.vpc_id
  instance_name = "instance-wp"
}

module "rds" {
  source               = "./modules/rds"
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_subnet_group_name = var.db_subnet_group_name
  security_group_id    = var.rds_security_group_id
  vpc_id               = var.vpc_id
}

module "lb" {
  source                = "./modules/lb"
  lb_security_group_id  = var.lb_security_group_id
  vpc_id                = var.vpc_id
  lb_subnets            = var.lb_subnets
  instance-wp-id        = var.instance-wp-id

}
