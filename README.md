![Terraform CI](https://github.com/kou-sato-ds/AWS_IaC_Terraform/actions/workflows/terraform-ci.yml/badge.svg)

# 🏗️ AWS Infrastructure as Code (Terraform) - Data Platform

AWS Certified Data Engineer - Associate (DEA) の要件に基づき、**「セキュアで再利用性の高いデータレイク基盤」**をTerraformで構築したプロジェクトです。
単なるリソース作成に留まらず、エンタープライズレベルのセキュリティベストプラクティスをコードとして実装しています。

---

## 📊 システムアーキテクチャ (Architecture Diagram)

```mermaid
graph LR
    subgraph "Terraform Engine"
        TF[Terraform CLI] -->|Plan / Apply| STATE[(tfstate)]
    end

    subgraph "AWS Cloud"
        direction TB
        subgraph "S3 Data Lake"
            B[S3 Bucket]
            B -->|Enable| ENC[SSE-S3 Encryption]
            B -->|Enable| VER[Versioning]
            B -->|Strict| PAB[Public Access Block]
        end
    end

    style B fill:#f96,stroke:#333,stroke-width:2px,color:#fff
    style TF fill:#5c4ee5,stroke:#fff,stroke-width:2px,color:#fff