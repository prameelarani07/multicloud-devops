
output "ec2_instance_id" {
  description = "CloudPilot EC2 instance ID"
  value       = aws_instance.cloudpilot.id
}

output "ec2_public_ip" {
  description = "CloudPilot public IP address"
  value       = aws_instance.cloudpilot.public_ip
}

output "cloudpilot_url" {
  description = "CloudPilot application URL"
  value       = "http://${aws_instance.cloudpilot.public_ip}"
}
