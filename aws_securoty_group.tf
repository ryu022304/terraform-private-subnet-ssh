resource "aws_security_group" "private-ec2" {
  name        = "${var.app_name}-private-ec2"
  description = "For private EC2 ${var.app_name}"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "private-ec2" {
  security_group_id = aws_security_group.private-ec2.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}
