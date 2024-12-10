resource "aws_security_group" "allow_all" {
  name        = "${var.vpc_name}-allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_service
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.vpc_name}-allow-all"
#    Owner = local.Owner
#    costcenter = local.costcenter
#    TeamDL = local.TeamDL
    environment = "${var.environment}"
  }
}