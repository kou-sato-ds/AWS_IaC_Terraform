# 1. 外部（命令書）から受け取る変数の定義
variable "bucket_name" {
  description = "S3バケットの一意の名前"
  type        = string
}

variable "environment" {
  description = "利用環境 (dev/prodなど)"
  type        = string
  default     = "dev"
}

# 2. S3バケット本体の作成
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 3. セキュリティ設定：パブリックアクセスのブロック
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 4. アウトプットの定義
output "s3_bucket_id" {
  value = aws_s3_bucket.this.id
}