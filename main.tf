provider "aws" {
  region = "us-east-1"
}

resource "random_string" "bucket_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "teamcity_bucket" {
  bucket = "teamcity-demo-${random_string.bucket_suffix.result}"

  tags = {
    Project = "teamcity-poc"
  }
}