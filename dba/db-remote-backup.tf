resource "aws_db_instance_automated_backups_replication" "unbreakable-db" {
    provider                  = aws.replica
    source_db_instance_arn    = aws_db_instance.unbreakable-db.arn
    kms_key_id                = aws_kms_key.unbreakable-db.arn
    retention_period          = 7
}