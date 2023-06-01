### ASG ###
resource "aws_launch_template" "first_template" {
  name_prefix            = "terraform_launch_template"
  image_id               = data.aws_ami.latest_amazon_linux.image_id
  instance_type          = "t2.micro"
  update_default_version = true
  vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
  iam_instance_profile {
    name = aws_iam_instance_profile.iam-profile.name
  }
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    amazon-linux-extras install -y nginx1
    systemctl enable nginx --now
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><style>body {font-size: 20px;}</style><body><p>Server: Ace!! &#x1F0A1;</p></body></html>' | sudo tee /usr/share/nginx/html/index.html
    EOF
  )
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = [ aws_subnet.subnet_private_1a.id, aws_subnet.subnet_private_1b.id ]
  #vpc_zone_identifier = data.aws_subnets.terraform_asg_subnets.ids

  launch_template {
    id      = aws_launch_template.first_template.id
    version = "$Latest"
  }

  target_group_arns = [ aws_lb_target_group.nginx.arn ]
}