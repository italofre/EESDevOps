output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "lb_dns_name" {
  value       = module.lb.lb_dns_name
}

output "public_ip" {
  value       = module.ec2.public_ip
}
