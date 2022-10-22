resource "aws_launch_configuration" "launch_conf"{
    name_prefix = "${var.env}-launch_conf"
    image_id = data.aws_ami.amazon_linux2.image_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.launch_conf_sg.id]
    key_name = aws_key_pair.terraform_key.key_name
    user_data = data.template_file.user_data.rendered

lifecycle {
    create_before_destroy = true
  }
}

