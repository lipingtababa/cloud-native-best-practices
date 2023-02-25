resource "aws_db_instance" "unbreakable-db" {
    allocated_storage       = 100
    identifier              = "unbreakable-db"

    storage_encrypted       = true

    engine                  = "postgres"
    engine_version          = "14.6"
    allow_major_version_upgrade = true
    auto_minor_version_upgrade  = true
    
    instance_class          = "db.m6g.large"
    db_name                 = "unbreakable"
    username                = "magong"
    password                = random_password.db_password.result

    delete_automated_backups    = false
    backup_retention_period     = 7
    skip_final_snapshot         = false
    final_snapshot_identifier   = "unbreakable-db-deathbed-snapshot-${random_id.snapshot_suffix.hex}"

    db_subnet_group_name        = aws_db_subnet_group.unbreakable-db.name
    multi_az                    = true
    publicly_accessible         = false
    vpc_security_group_ids      = [aws_security_group.unbreakable-db.id]


    performance_insights_enabled            = true
    performance_insights_retention_period   = 7

    lifecycle {
        prevent_destroy = false
    }

    tags = {
        Name = "unbreakable-db"
    }
}

resource "random_password" "db_password" {
    length = 32
    special = false
}

resource "random_id" "snapshot_suffix" {
    byte_length = 4
}
