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

}