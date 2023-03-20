provider "aws" {
    region = "us-east-1"
    default_tags {
        tags = {
            Team  = "payments"
            Service = "smooth-payments"
            Stage = "production"
        }
    }
}

provider "aws" {
    region = "us-west-2"
    alias  = "replica"
    default_tags {
        tags = {
            Team  = "payments"
            Service = "smooth-payments"
            Stage = "production"
        }
    }
}