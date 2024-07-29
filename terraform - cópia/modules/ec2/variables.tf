variable "ami" {}

variable "instance_type" {}

variable "key_name" {}

variable "security_group_id" {}

variable "subnet_id" {}

variable "vpc_id" {}

variable "instance_name" {}

variable "db_password" {}

variable "associate_public_ip" {
  type        = bool
  default     = true
}
