resource "aws_lb_target_group" "main" {
  name     = "${var.env}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    port = var.app_port
  }
tags = {
    Name = "${var.env}-tg"
 }
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}



resource "aws_lb" "test" {
  name               = "${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnet

  tags = {
    Name = "${var.env}-alb"
  }
}

############## lb-listener-rule #################


resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}