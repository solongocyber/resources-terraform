resource "aws_security_group" "alb_sg" {
  name        = "${var.env}-alb-sg"
  description = "This is sg for alb"
  vpc_id = data.terraform_remote_state.vpc_v3.outputs.vpc_id
  
}

resource "aws_security_group_rule" "alb_ingress" {
    count = length(var.ports)
    type = "ingress"
    description      = "This is alb ingress rule"
    from_port        = element(var.ports , count.index)
    to_port          = element(var.ports , count.index)
    protocol         = var.protocol
    cidr_blocks      = [var.sg_cidr]
    security_group_id = aws_security_group.alb_sg.id
  }

  resource "aws_security_group_rule" "alb_egress" {
    type = "egress"
    from_port        = var.egress_port
    to_port          = var.egress_port
    protocol         = var.egress_protocol
    cidr_blocks      = [var.sg_cidr]
    security_group_id = aws_security_group.alb_sg.id
    
  }
