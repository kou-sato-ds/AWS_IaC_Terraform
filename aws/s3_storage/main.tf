# --- Provider Setup ---
provider "aws" {
  region = var.aws_region
}

# --- S3 Bucket for Data Lake ---
resource "aws_s3_bucket" "data_lake" {
  bucket = var.bucket_name

  tags = {
    Name        = "Bento-Prediction-Data-Lake"
    Environment = "dev"
    Project     = "DS-Exam-Training"
  }
}

# --- Public Access Block (DE分野：セキュリティの鉄則) ---
resource "aws_s3_bucket_public_access_block" "data_lake_block" {
  bucket = aws_s3_bucket.data_lake.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}