resource "aws_kms_key" "unbreakable-db" {
    description = "Encryption key for unbreakable-db's automated backups"
    provider = aws.replica

    multi_region = true
    policy = <<POLICY
    {
    "Version": "2012-10-17",
    "Id": "key-policy",
    "Statement": [
        {
            "Sid": "Enable RDS to use the key",
            "Effect": "Allow",
            "Principal": {
                "Service": "rds.amazonaws.com"
            },
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Allow key administrator to modify the key policy",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::234443379770:root"
            },
            "Action": [
                "*"
            ],
            "Resource": "*"
        }
    ]
    }
    POLICY
}