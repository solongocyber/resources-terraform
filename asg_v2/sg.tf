resource "aws_security_group" "launch_conf_sg"{
name = "${var.env}-lc_sg"
description = "This sg is for a lc"

}

resource "aws_security_group_rule" "ingress_rule"{
  count = length(var.ingress_port)
  type              = "ingress"
    description      = "ingress rule"
    from_port        = element(var.ingress_port, count.index)
    to_port          = element(var.ingress_port, count.index)
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_blocks]
    security_group_id = aws_security_group.launch_conf_sg.id
    
  }

  resource "aws_security_group_rule" "egress_rule"{
    type              = "egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    security_group_id = aws_security_group.launch_conf_sg.id
}