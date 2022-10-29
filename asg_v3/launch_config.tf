resource "aws_launch_configuration" "launch_conf_v3" {
  name_prefix   = replace(local.name, "rtype" , "lc_v3")
  image_id      = data.aws_ami.amazon_linux2.id
  instance_type = var.env == "dev" ? var.dev_instance_type : var.prod_instance_type
  key_name = aws_key_pair.public_key.key_name
  security_groups = [aws_security_group.asg_sg.id]

  lifecycle {
    create_before_destroy = true
  }

// provisioner "remote-exec" {
//     inline = [
//       "sudo yum install httpd -y",
//       "sudo systemctl enable httpd",
//       "sudo systemctl start httpd",
//       "sudo echo  'Hello' >> /var/www/html/index.html"
//     ]

//     connection {
//       type        = "ssh"
//       user        = "ec2-user"
//       host        = 
//       private_key = file("~/.ssh/id_rsa")
//     }
//   }
}


resource "aws_key_pair" "public_key" {
  key_name   = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")

}