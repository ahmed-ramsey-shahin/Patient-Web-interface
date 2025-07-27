resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}
