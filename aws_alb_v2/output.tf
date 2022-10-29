output "alb_id" {
    value = aws_lb.alb_v2.id
}

output "alb_tg" {
    value = aws_lb_target_group.alb_tg.arn
}