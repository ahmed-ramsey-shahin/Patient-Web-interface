variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet to launch the EC2 instance in"
  type        = string
}

variable "security_group_id" {
  description = "Security group to attach to the instance"
  type        = string
}

variable "key_name" {
  description = "SSH key name to use"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for instance name"
  type        = string
}
