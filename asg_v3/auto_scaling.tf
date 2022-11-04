resource "aws_autoscaling_group" "asg_v3" {
  name_prefix                      = replace(local.name , "rtype" ,"asg_v3")
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = var.env == "dev" ? true : false
  launch_configuration      = aws_launch_configuration.launch_conf_v3.name
  vpc_zone_identifier       = data.terraform_remote_state.vpc_v3.outputs.subnet_id

  tag {
    key = "Name"
    value = replace(local.name , "rtype" , "asg_v3")
    propagate_at_launch = true 
  }
  dynamic "tag" {
    for_each = local.common_tags
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true 
    }
  }
}

resource "aws_autoscaling_policy" "scaling_up" {
  name                   = "terraform_Simple_Scaling_Policy_scale_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg_v3.name
}
resource "aws_autoscaling_policy" "scale-down" {
  name                   = "terraform_Simple_Scaling_Policy_scale_down"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_v3.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "terraform-cpu_utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_v3.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scaling_up.arn]
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg_v3.id
  alb_target_group_arn    = data.terraform_remote_state.alb_tg.outputs.alb_tg
}