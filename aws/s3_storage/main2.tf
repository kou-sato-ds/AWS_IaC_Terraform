# --- Provider Configuration ---
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

# --- S3 Data Lake Bucket ---
resource "aws_s3_bucket" "analysis_data" {
  bucket = "kou-sato-ds-analysis-20260223-final"

  tags = {
    Name        = "DataLakeForAnalysis"
    Environment = "Dev"
    Project     = "Bento_and_Churn"
    Owner       = "Kou-Sato"
  }
}

# --- Security: Public Access Block ---
resource "aws_s3_bucket_public_access_block" "secure_storage" {
  bucket = aws_s3_bucket.analysis_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}