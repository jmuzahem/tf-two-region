# Provider for Region 1
provider "aws" {
  profile = "hashi_aws"
  region  = var.region1
}

# Provider for Region 2 (alias)
provider "aws" {
  profile = "hashi_aws"
  alias   = "west"
  region  = var.region2
}

# S3 bucket in us-east-1
resource "aws_s3_bucket" "east" {
  bucket = var.bucket1_name
}

# S3 bucket in us-west-2
resource "aws_s3_bucket" "west" {
  provider = aws.west
  bucket   = var.bucket2_name
}
