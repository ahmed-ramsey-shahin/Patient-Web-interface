data "aws_instance" "existing_ec2" {
  instance_id = "i-0d048fc6611f0f845"
}

output "existing_instance_id" {
  value = data.aws_instance.existing_ec2.id
}

output "existing_instance_public_ip" {
  value = data.aws_instance.existing_ec2.public_ip
}
