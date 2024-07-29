output "instance_id" {
  value       = aws_instance.instance-wp.id
}

output "public_ip" {
  value       = aws_instance.instance-wp.public_ip
}
