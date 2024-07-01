output "ec2_ip_address" {
  value = aws_instance.jenkins.public_ip
}

output "ec2_availability_zone" {
  value = aws_instance.jenkins.availability_zone
}

output "ec2_public_dns_name" {
  value = aws_instance.jenkins.public_dns
}

output "ec2_instance_id" {
  value = aws_instance.jenkins.id
}

output "ec2_ami_id" {
  value = aws_instance.jenkins.ami
}
