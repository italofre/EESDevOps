variable "region" {}
variable "instance_type" {}
variable "key_name" {}
variable "ec2_security_group_id" {}
variable "lb_security_group_id" {}
variable "rds_security_group_id" {}
variable "lb_subnets" {
  type = list(string)
}
variable "subnet_ids" {}
variable "ec2_subnet_id" {}
variable "vpc_id" {}
variable "db_username" {}
variable "db_password" {}
variable "db_name" {}
variable "db_subnet_group_name" {}
variable "ami" {}
variable "instance-wp-id" {}