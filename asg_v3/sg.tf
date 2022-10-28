resource "aws_security_group" "asg_sg" {
  name        = replace(local.name , "rtype" , "auto_scaling_sg")
  description = "This sg is for auto scaling"
 
 
}
  resource "aws_security_group_rule" "asg_ingress" {
    count = length(var.ports)
    type = "ingress"
    description      = "This is asg ingress rule"
    from_port        = element(var.ports , count.index)
    to_port          = element(var.ports , count.index)
    protocol         = var.protocol
    cidr_blocks      = [var.sg_cidr]
    security_group_id = aws_security_group.asg_sg.id
  }

  resource "aws_security_group_rule" "asg_egress" {
    type = "egress"
    from_port        = var.egress_port
    to_port          = var.egress_port
    protocol         = var.egress_protocol
    cidr_blocks      = [var.sg_cidr]
    security_group_id = aws_security_group.asg_sg.id
    
  }
