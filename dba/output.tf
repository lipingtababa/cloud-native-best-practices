# Purpose: Output the database name, arn, and ip address

output "db-password" {
    value = random_password.db_password.result
    sensitive = true
}

output "db-name" {
    value = aws_db_instance.unbreakable-db.name
}

output "db-arn" {
    value = aws_db_instance.unbreakable-db.arn
}

output "db-address" {    
    value = aws_db_instance.unbreakable-db.address
}

output "vm-address"{
    value = aws_instance.unbreakable-app.public_ip
}