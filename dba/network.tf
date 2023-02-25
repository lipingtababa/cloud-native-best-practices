resource "aws_subnet" "unbreakable-subnet1" {
    vpc_id                  = var.vpc-id
    cidr_block              = "172.31.101.0/24"
    availability_zone       = "us-east-1a"
}

resource "aws_subnet" "unbreakable-subnet2" {
    vpc_id                  = var.vpc-id
    cidr_block              = "172.31.102.0/24"
    availability_zone       = "us-east-1b"
}

resource "aws_db_subnet_group" "unbreakable-db" {
  name       = "main"
  subnet_ids = [aws_subnet.unbreakable-subnet1.id, aws_subnet.unbreakable-subnet2.id]
}

resource "aws_security_group" "unbreakable-db" {
    name        = "unbreakable-db"
    description = "Allow inbound traffic from the app"
    vpc_id      = var.vpc-id
}

resource "aws_security_group" "unbreakable-app" {
    name        = "unbreakable-app"
    description = "Allow inbound HTTPS traffic and outbound db traffic"
    vpc_id      = var.vpc-id
}

resource "aws_security_group_rule" "db-sg-ingress-rules" {
    type              = "ingress"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    source_security_group_id = aws_security_group.unbreakable-app.id
    security_group_id = aws_security_group.unbreakable-db.id
}

resource "aws_security_group_rule" "app-sg-egress-rule-pg" {
    type              = "egress"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    source_security_group_id = aws_security_group.unbreakable-db.id
    security_group_id = aws_security_group.unbreakable-app.id
}

resource "aws_security_group_rule" "app-sg-egress-rule-https" {
    type              = "egress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.unbreakable-app.id
}

resource "aws_security_group_rule" "app-sg-ingress-rule-https" {
    type              = "ingress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.unbreakable-app.id
}

resource "aws_security_group_rule" "app-sg-ingress-rule-ssh" {
    type              = "ingress"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.unbreakable-app.id
}