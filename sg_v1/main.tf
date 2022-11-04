resource "aws_security_group" "custom_sg" {
  name        = "${var.env}-custom_sg"
  description = "SG for auto scaling group"
//   vpc_id      = var.vpc_id
}

// resource "aws_security_group_rule" "ingress_rule" {
//   count = length(var.ingress_rule)
//   type              = "ingress"
//   from_port         = element(var.ingress_rule , count.index)
//   to_port           = element(var.ingress_rule , count.index)
//   protocol          = "tcp"
//   cidr_blocks       = [var.cidr_block]
//   security_group_id = aws_security_group.custom_sg.id
// }

// resource "aws_security_group_rule" "egress_rule" {
//   type              = "egress"
//   from_port         = var.egress_rule
//   to_port           = var.egress_rule
//   protocol          = var.egress_protocol
//   cidr_blocks       = [var.cidr_block]
//   security_group_id = aws_security_group.custom_sg.id
// }

################ For_each ################


resource "aws_security_group" "custom_sg_1" {
  name        = "${var.env}-custom_sg_1"
  description = "SG for auto scaling group"
//   vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_rule" {
  for_each = var.ingress_rules
  type              = "ingress"
  from_port         = each.key
  to_port           = each.key
  protocol          = "tcp"
  cidr_blocks       = [each.value]
  security_group_id = aws_security_group.custom_sg.id
}

