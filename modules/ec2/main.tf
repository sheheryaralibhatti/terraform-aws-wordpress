resource "aws_launch_configuration" "wordpress" {
  name            = "${var.name}-launch-configuration"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_groups

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install php7.4 -y
              yum install -y httpd php php-mysqlnd
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              mv wordpress/* .
              chown -R apache:apache /var/www/html
              systemctl restart httpd
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "wordpress" {
  launch_configuration = aws_launch_configuration.wordpress.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  vpc_zone_identifier  = var.subnets
}

resource "aws_elb" "wordpress" {
  name = "${var.name}-elb"

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  instances                 = aws_autoscaling_group.wordpress.id
  cross_zone_load_balancing = true
  idle_timeout              = 400
  security_groups           = [var.elb_security_group]
  subnets                   = var.subnets

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
