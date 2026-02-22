# Infrastructure as Code (IaC) - Data Platform

このリポジトリは、銀行顧客離脱予測プロジェクト等のデータ分析基盤を管理するためのTerraformコードを格納しています。

## 🏗️ 構成 (Components)
- **AWS S3**: 分析用データレイク（`aws/s3_storage`）
  - セキュリティ：Public Access Block設定済み

## 🚀 使い方 (Usage)
```bash
cd aws/s3_storage
terraform init
terraform plan
terraform apply