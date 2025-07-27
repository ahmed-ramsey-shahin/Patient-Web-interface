terraform {
    backend "s3" {
        bucket = "iti-tf-bucket-ahmed"
        key    = "statefile/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "eksdb"
        encrypt = true
    }
}
