module "vpc" {
  source = "./modules/vpc"
  cluster_name = var.cluster_name
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zones = var.availability_zones
}
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}

module "ec2_instance" {
  source            = "./modules/ec2"
  ami_id            = "ami-08a6efd148b1f7504"
  instance_type     = "t3.small"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = aws_security_group.ec2_sg.id
  key_name          = "vockey"
  name_prefix       = "eks"

  depends_on = [module.vpc]
}
