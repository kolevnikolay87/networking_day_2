data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = [var.image_name]
  }
}

data "aws_subnets" "terraform_asg_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }
}