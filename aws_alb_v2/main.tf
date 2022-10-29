resource "aws_lb_target_group" "alb_tg" {
  name     = replace(local.name , "rtype" , "tg")
  port     = var.alb_tg_port
  protocol = "HTTP"
  vpc_id = data.terraform_remote_state.vpc_v3.outputs.vpc_id
  health_check {
    path = "/"
    port = var.alb_tg_port
  }
tags = merge(local.common_tags , { Name = replace(local.name , "rtype" , "alb_tg")})

}


resource "aws_lb" "alb_v2" {
  name               = replace(local.name , "rtype" , "alb-v2")
  internal           = var.env != "dev" ? true : false 
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.terraform_remote_state.vpc_v3.outputs.subnet_id

  tags = merge(local.common_tags , { Name = replace(local.name , "rtype" , "alb_v2")})
}


resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.alb_v2.arn
  port              = var.alb_tg_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

