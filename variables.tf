variable "region" {
  type = string
  description = "Default AWS region"
  default = "eu-west-1"
}

variable "ec2_type" {
  type = string
  description = "Default EC2 type"
  default = "t2.micro"
}

variable "image_name" {
  default     = "amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"
  type        = string
  description = "Amazon linux image name"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "Main VPC CIDR block"
}

variable "subnet_public_1a_01" {
  type = string
  default = "10.0.1.0/24"
  description = "Public subnet in eu-west-1a"
}

variable "subnet_private_1a_03" {
  type = string
  default = "10.0.3.0/24"
  description = "Private subnet in eu-west-1a"
}

variable "subnet_public_1b_02" {
  type = string
  default = "10.0.2.0/24"
  description = "Public subnet in eu-west-1a"
}

variable "subnet_private_1b_04" {
  type = string
  default = "10.0.4.0/24"
  description = "Private subnet in eu-west-1b"
}

variable "availability_zone_1a" {
  type = string
  default = "eu-west-1a"
}

variable "availability_zone_1b" {
  type = string
  default = "eu-west-1b"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

