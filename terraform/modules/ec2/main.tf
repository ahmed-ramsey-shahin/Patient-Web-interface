resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [var.security_group_id]
  root_block_device {
    volume_type = "gp2"        # Allowed by policy
    volume_size = 8            # Must be ≤ 35 GiB
    delete_on_termination = true
  }

  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}
