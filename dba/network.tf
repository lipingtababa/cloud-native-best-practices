resource "aws_vpc" "unbreakable-vpc" {
    cidr_block = "172.31.0.0/16"
}

resource "aws_subnet" "unbreakable-subnet1" {
    vpc_id                  = aws_vpc.unbreakable-vpc.id
    cidr_block              = "172.31.1.0/24"
    availability_zone       = "us-east-1a"
}

resource "aws_subnet" "unbreakable-subnet2" {
    vpc_id                  = aws_vpc.unbreakable-vpc.id
    cidr_block              = "172.31.2.0/24"
    availability_zone       = "us-east-1b"
}

resource "aws_db_subnet_group" "unbreakable-db" {
  name       = "main"
  subnet_ids = [aws_subnet.unbreakable-subnet1.id, aws_subnet.unbreakable-subnet2.id]
}

resource "aws_security_group" "unbreakable-db" {
    name        = "unbreakable-db"
    description = "Allow inbound traffic from the app"
    vpc_id      = aws_vpc.unbreakable-vpc.id
}

resource "aws_security_group" "unbreakable-app" {
    name        = "unbreakable-app"
    description = "Allow inbound HTTPS traffic and outbound db traffic"
    vpc_id      = aws_vpc.unbreakable-vpc.id
}

resource "aws_security_group_rule" "db-sg-ingress-rules" {
    type              = "ingress"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    source_security_group_id = aws_security_group.unbreakable-app.id
    security_group_id = aws_security_group.unbreakable-db.id
}

resource "aws_security_group_rule" "app-sg-egress-rules" {
    type              = "egress"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    source_security_group_id = aws_security_group.unbreakable-db.id
    security_group_id = aws_security_group.unbreakable-app.id
}

resource "aws_security_group_rule" "app-sg-ingress-rules" {
    type              = "ingress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.unbreakable-app.id
}