# Infrastructure as Code (IaC) - Data Platform

このリポジトリは、AWS上にデータ分析基盤をセキュアかつ再利用可能な形で構築するためのTerraformコードを格納しています。

## 🏗️ アーキテクチャのこだわり (Architecture Focus)
AWS Certified Data Engineer - Associate (DEA) の要件を満たす、保守性の高い設計を採用しています。

- **Modular Design**: リソース（S3, IAM等）を `modules/` に集約し、再利用性を確保。
- **Environment Separation**: `environments/` フォルダにより、開発・本番などの環境を安全に分離管理。
- **Data Governance**: 
  - `Public Access Block` によるS3バケットの完全非公開化。
  - データの不変性（Immutability）を担保する設計。

## 📂 ディレクトリ構成 (Directory Structure)
```text
.
├── aws/                # AWS固有のプロバイダー設定等
├── environments/       # 環境別の実行ディレクトリ (dev, prod等)
├── modules/            # 再利用可能なリソース定義（S3バケット等）
├── .gitignore          # tfstate等の機密ファイル除外設定
└── README.md           # 本ドキュメント