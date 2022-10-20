
resource "aws_autoscaling_group" "main" {
  name                      = "${var.env}-main-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = "EC2" 
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  launch_configuration      = aws_launch_configuration.launch_conf_1.name
  vpc_zone_identifier       = var.vpc_zone_identifier


instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

lifecycle {
    create_before_destroy = true
  }
}

##Lifecycle create lc before destroy lc. 