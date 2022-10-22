resource "aws_autoscaling_group" "asg" {
    // count = length(var.vpc_zone_identifier)
  name                      = "${var.env}-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = var.desired
  launch_configuration      = aws_launch_configuration.launch_conf.name
  vpc_zone_identifier       = var.vpc_zone_identifier
}

resource "aws_autoscaling_policy" "simple_scaling" {
  name                   = "terraform-test"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
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
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.simple_scaling.arn]
}