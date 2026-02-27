# --- AWS Provider ---
provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
　region = "ap-northeast-1"
}

# --- S3 Data Lake (DEA Focus: Encryption & Protection) ---
resource "aws_s3_bucket" "analysis_data" {
  bucket = "kou-sato-ds-analysis-20260223-final" # 重複を避けるため任意に変更可

  tags = {
    Project = "Bento_and_DEA"
    Owner   = "Kou-Sato"
  }
}

resource "aws_s3_bucket" "analysis_data" {
　bucket = "kou-sato-ds-analysis-20260227-final"

  tags = {
    Project = "Bento_and_DEA"
    Owner   = "Kou-Sato"
  }
}


# 1. パブリックアクセス遮断
resource "aws_s3_bucket_public_access_block" "secure_storage" {
  bucket = aws_s3_bucket.analysis_data.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_acess_block" "secure_storage" {
  bucket = aws_s3_bucket.analysis_data.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 2. サーバー側暗号化 (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "data_encryption" {
  bucket = aws_s3_bucket.analysis_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "data_encryption" {
  bucket = aws_s3_bucket.analysis_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 3. バージョニング（データ保護）
resource "aws_s3_bucket_versioning" "data_versioning" {
  bucket = aws_s3_bucket.analysis_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "data_versioning" {
  bucket = aws_s3_bucket.analysis_data.id
  versioning_configuration {
    status = "Enabled"
  }
}