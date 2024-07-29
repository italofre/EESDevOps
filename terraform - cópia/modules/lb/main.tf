resource "aws_lb" "wordpress-ees" {
  name               = "wordpress-ees"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_security_group_id]
  subnets            = var.lb_subnets
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true
  tags = {
    Name = "wordpress-ees"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.wordpress-ees.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-instance.arn
  }
}

resource "aws_lb_target_group" "tg-instance" {
  name     = "tg-instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 12
    healthy_threshold    = 2
    unhealthy_threshold  = 2
  }
}

resource "aws_lb_target_group_attachment" "wordpress-tg-attachment" {
  target_group_arn = aws_lb_target_group.tg-instance.arn
  target_id        = var.instance-wp-id
  port             = 80
}