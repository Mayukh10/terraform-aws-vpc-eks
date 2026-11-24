resource "aws_security_group" "app" {
  name        = "my-security-group"
  description = "Security group for my application"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "allow_http" {
  description       = "Allow HTTP inbound traffic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}

resource "aws_security_group_rule" "allow_outbound" {
  description       = "Allow all outbound traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}
