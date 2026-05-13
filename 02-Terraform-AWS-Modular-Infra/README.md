# 🚀 Terraform AWS Modular Infrastructure Project

## 📌 Overview

This project demonstrates a **modular Infrastructure-as-Code (IaC) architecture using Terraform on AWS**.  
It is designed to reflect real-world DevOps practices including:

- Modular Terraform design
- Environment-based deployment (Dev)
- Reusable infrastructure components
- Clean separation of concerns
- Scalable AWS architecture patterns

The goal of this project is to simulate a production-like AWS environment using best practices commonly used in cloud engineering teams.

---

# 🏗️ Architecture

The infrastructure follows a layered design:


VPC → Networking Layer
│
├── Security Group → Access Control Layer
│
├── EC2 → Compute Layer
│
└── S3 → Storage Layer


### 🧭 Flow of Infrastructure

1. A VPC is created to isolate the network
2. Public subnets are provisioned across availability zones
3. Security Groups control inbound/outbound traffic
4. EC2 instances are deployed inside the VPC
5. S3 bucket is provisioned for object storage

---

# 📁 Project Structure

```

02-Terraform-AWS-Modular-Infra/
│
├── modules/
│   ├── vpc/
│   ├── security-group/
│   ├── ec2/
│   └── s3/
│
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── outputs.tf
│
└── README.md

🧩 Modules Overview
📌 VPC Module

Creates a complete networking layer including:

VPC
Public Subnets
Internet Gateway
Route Tables
Route Table Associations
Outputs:
VPC ID
Public Subnet IDs
🔐 Security Group Module

Defines firewall rules for EC2 instances.

Features:
Dynamic ingress rule creation
Fully open egress rules (for outbound access)
Port-based access control (SSH, HTTP, etc.)
Inputs:
Allowed ports list
VPC ID
Environment tagging
Output:
Security Group ID
🖥️ EC2 Module

Provisions compute instances inside the VPC.

Features:
Amazon Linux 2 AMI (latest)
Public IP enabled
VPC subnet deployment
Security group attachment
Tag-based resource identification
Inputs:
Instance type
Subnet ID
Security Group ID
Key pair name
Outputs:
Instance ID
Public IP
Private IP
🗄️ S3 Module

Creates a secure and versioned S3 bucket.

Features:
Bucket versioning enabled
Environment-based tagging
Object storage for logs / artifacts / backups
Output:
Bucket ID
🌍 Environment: Dev

The dev environment represents a non-production sandbox environment used for testing infrastructure.

Resources Deployed:
1 VPC
2 Public Subnets
1 Security Group
1 EC2 Instance (web server)
1 S3 Bucket
⚙️ Dev Configuration
Provider
provider "aws" {
  region = var.aws_region
}
Terraform Variables
aws_region = "us-east-1"
📤 Dev Outputs

After deployment, the following outputs are available:

EC2 Public IP
VPC ID
S3 Bucket Name
🚀 How to Use This Project
1️⃣ Initialize Terraform
terraform init
2️⃣ Validate Configuration
terraform validate
3️⃣ Format Code
terraform fmt -recursive
4️⃣ Plan Deployment
terraform plan
5️⃣ Apply Infrastructure
terraform apply

Type:

yes
🔐 Security Considerations

This project follows basic cloud security practices:

Security Groups control inbound access
Public IP is enabled only for compute layer
IAM is not included (simplified architecture)
S3 bucket versioning enabled
📈 What This Project Demonstrates

This project showcases:

🧠 Terraform Skills
Module-based architecture
Input/output design
Environment separation
Resource abstraction
☁️ AWS Skills
VPC networking design
EC2 provisioning
Security group configuration
S3 storage setup
🏗️ DevOps Principles
Infrastructure as Code (IaC)
Reusability
Scalability
Clean architecture design
📌 Future Improvements (Optional Enhancements)
Remote backend using S3 + DynamoDB
CI/CD using GitHub Actions
Multi-environment support (prod/stage)
Load balancer integration (ALB)
Auto scaling groups
IAM role integration for EC2
👨‍💻 Author

DevOps Infrastructure Project

Designed and implemented as a hands-on Terraform learning + portfolio project demonstrating real-world AWS infrastructure patterns.

⭐ Final Note

This project is intentionally designed to be:

Simple enough to understand
Structured like production systems
Modular for scalability
Suitable for DevOps portfolio demonstration