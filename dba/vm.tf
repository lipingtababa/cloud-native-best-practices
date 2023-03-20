resource "aws_instance" "unbreakable-app" {
    ami           = var.image_id
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.unbreakable-subnet2.id
    vpc_security_group_ids = [aws_security_group.unbreakable-app.id]
    key_name      = aws_key_pair.ssh-key.key_name
    associate_public_ip_address = true
}

resource "aws_key_pair" ssh-key {
    key_name = "magong-sweden"
    public_key = var.public_key
}