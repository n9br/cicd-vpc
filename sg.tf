#   Security Group
resource "aws_security_group" "cicd-sg" {
  name   = "cicd-sg"
  vpc_id = aws_vpc.cicd-vpc.id
  tags = {
    Name = "cicd-sg"
  }
}

resource "aws_security_group_rule" "cicd-ingress-ssh" {
  security_group_id = aws_security_group.cicd-sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "cicd-egress-all" {
  security_group_id = aws_security_group.cicd-sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
