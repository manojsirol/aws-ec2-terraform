output "instance_id" {
  description = "ID of the provisioned EC2 instance"
  value       = aws_instance.mynewcrete.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.mynewcrete.public_ip
}

output "security_group_id" {
  description = "ID of the provisioned Security Group"
  value       = aws_security_group.my_sg.id
}
