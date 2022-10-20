resource "aws_launch_configuration" "launch_conf_1"{
  name          = "${var.env}-lc-new"
  image_id      = "ami-097a2df4ac947655f"
  instance_type = var.instance_type
  user_data = data.template_file.user_data.rendered 
  security_groups = [ aws_security_group.main.id ]
  key_name = aws_key_pair.terraform_key.key_name
  
  ##Lifecycle create lc before destroy lc. without this lc is immutable so it will not make change any
## lc uses name instead of id. So name is important if you make any change.

lifecycle {
    create_before_destroy = true
  }

}


resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")
}




#launch config is immutable, it means once you created not able to update. You need to create new launch configuration. 
# Naming standard and taging standard