# 🚀 Terraform AWS Modular Infrastructure

> Production-grade, modular AWS infrastructure provisioning using Terraform — designed with scalability, reusability, and real-world DevOps engineering practices in mind.

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform" />
  <img src="https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws" />
  <img src="https://img.shields.io/badge/DevOps-Automation-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Infrastructure-Modular-success?style=for-the-badge" />
</p>

---

# 📌 Overview

This project demonstrates a **production-inspired AWS Infrastructure-as-Code (IaC) architecture** built using **Terraform** with a strong focus on:

* Modular infrastructure design
* Environment isolation
* Reusable Terraform modules
* Scalable cloud architecture
* Clean DevOps engineering practices
* Maintainability and extensibility

The infrastructure is structured to reflect how modern engineering teams provision and manage cloud resources in real-world environments.

---

# 🏗️ Infrastructure Architecture

The project follows a **layered modular architecture** where each infrastructure component is isolated into reusable Terraform modules.

```text
                    ┌──────────────────────┐
                    │        VPC           │
                    │  Networking Layer    │
                    └──────────┬───────────┘
                               │
               ┌───────────────┼────────────────┐
               │                                │
      ┌────────▼────────┐             ┌────────▼────────┐
      │ Security Group  │             │      S3         │
      │ Access Control  │             │ Storage Layer   │
      └────────┬────────┘             └─────────────────┘
               │
      ┌────────▼────────┐
      │      EC2        │
      │ Compute Layer   │
      └─────────────────┘
```

---

# 🧠 Key Engineering Concepts

This project demonstrates several industry-standard DevOps and Cloud Engineering concepts:

| Concept                          | Description                                                              |
| -------------------------------- | ------------------------------------------------------------------------ |
| **Infrastructure as Code (IaC)** | Entire AWS infrastructure managed declaratively using Terraform          |
| **Modular Architecture**         | Infrastructure components abstracted into reusable modules               |
| **Environment Separation**       | Dedicated environment structure for scalable deployments                 |
| **Resource Reusability**         | Modules designed to be reusable across multiple environments             |
| **Cloud Networking**             | Custom VPC, subnetting, routing, and internet access                     |
| **Security Management**          | Security Groups for controlled ingress/egress                            |
| **Stateful Infrastructure**      | Persistent and reproducible infrastructure provisioning                  |
| **Scalable Design**              | Foundation ready for autoscaling, CI/CD, and multi-environment expansion |

---

# ☁️ AWS Services Used

| Service              | Purpose                         |
| -------------------- | ------------------------------- |
| **Amazon VPC**       | Isolated networking environment |
| **EC2**              | Compute infrastructure          |
| **Security Groups**  | Network-level firewall control  |
| **S3**               | Object storage with versioning  |
| **Internet Gateway** | Public internet access          |
| **Route Tables**     | Traffic routing configuration   |

---

# 📁 Project Structure

```bash
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
```

---

# 🧩 Module Breakdown

## 📌 VPC Module

Responsible for provisioning the complete networking layer.

### Features

* Custom VPC creation
* Public subnet provisioning
* Internet Gateway integration
* Route Table configuration
* Route associations

### Resources Created

* VPC
* Public Subnets
* Internet Gateway
* Route Tables
* Route Table Associations

### Outputs

```hcl
vpc_id
public_subnet_ids
```

---

## 🔐 Security Group Module

Implements network access control for compute resources.

### Features

* Dynamic ingress rule creation
* Configurable allowed ports
* Open outbound internet access
* Environment-aware tagging

### Example Use Cases

* SSH access (`22`)
* HTTP traffic (`80`)
* HTTPS traffic (`443`)

### Outputs

```hcl
security_group_id
```

---

## 🖥️ EC2 Module

Deploys compute instances inside the configured VPC.

### Features

* Latest Amazon Linux 2 AMI
* Public IP association
* Security Group attachment
* Configurable instance types
* Tag-based resource management

### Outputs

```hcl
instance_id
public_ip
private_ip
```

---

## 🗄️ S3 Module

Creates a versioned and environment-aware storage bucket.

### Features

* S3 bucket provisioning
* Versioning enabled
* Environment-based tagging
* Artifact / backup storage support

### Outputs

```hcl
bucket_id
```

---

# 🌍 Environment Design

The infrastructure uses **environment-based separation** to support scalable deployments.

Current environments:

```bash
environments/
└── dev/
```

The `dev` environment acts as a sandbox for:

* Infrastructure testing
* Terraform experimentation
* Module validation
* Deployment verification

---

# ⚙️ Development Environment Configuration

## Provider Configuration

```hcl
provider "aws" {
  region = var.aws_region
}
```

---

## Terraform Variables

```hcl
aws_region = "us-east-1"
```

---

# 🚀 Deployment Workflow

## 1️⃣ Initialize Terraform

```bash
terraform init
```

Downloads required providers and initializes the working directory.

---

## 2️⃣ Validate Configuration

```bash
terraform validate
```

Checks Terraform syntax and configuration validity.

---

## 3️⃣ Format Terraform Files

```bash
terraform fmt -recursive
```

Applies consistent formatting across all Terraform files.

---

## 4️⃣ Review Execution Plan

```bash
terraform plan
```

Displays infrastructure changes before deployment.

---

## 5️⃣ Deploy Infrastructure

```bash
terraform apply
```

Approve the execution:

```bash
yes
```

---

# 📤 Infrastructure Outputs

After successful deployment, Terraform returns:

| Output         | Description                       |
| -------------- | --------------------------------- |
| EC2 Public IP  | Public access to compute instance |
| VPC ID         | Identifier of created VPC         |
| S3 Bucket Name | Name of provisioned S3 bucket     |

---

# 🔒 Security Considerations

This project incorporates foundational cloud security practices:

* Security Groups restrict inbound traffic
* Compute resources deployed inside isolated VPC
* Public access controlled via explicit ingress rules
* S3 bucket versioning enabled for data protection
* Environment-based tagging for governance

> Note: IAM roles and advanced security hardening are intentionally excluded to keep the project focused on Terraform modular architecture fundamentals.

---

# 📈 What This Project Demonstrates

## 🧠 Terraform Engineering Skills

* Modular Terraform architecture
* Variable abstraction
* Outputs and module composition
* Reusable infrastructure design
* Environment segregation
* Scalable IaC patterns

---

## ☁️ AWS Cloud Skills

* VPC networking
* Public subnet architecture
* EC2 provisioning
* Security Group management
* S3 object storage
* Route table configuration

---

## ⚙️ DevOps Practices

* Infrastructure as Code (IaC)
* Declarative infrastructure management
* Automation-ready architecture
* Clean repository organization
* Production-style infrastructure design

---

# 🛠️ Future Enhancements

The current architecture is intentionally minimal and extensible.

Potential production-grade improvements include:

* Remote backend using S3 + DynamoDB
* CI/CD pipelines using GitHub Actions
* Multi-environment deployment strategy
* Application Load Balancer (ALB)
* Auto Scaling Groups (ASG)
* IAM Roles for EC2
* Private subnets and NAT Gateway
* Monitoring with CloudWatch
* Terraform workspaces
* Secrets management using AWS Secrets Manager

---

# 🧪 Example Terraform Commands

```bash
# Initialize
terraform init

# Validate
terraform validate

# Format
terraform fmt -recursive

# Plan
terraform plan

# Apply
terraform apply

# Destroy Infrastructure
terraform destroy
```

---

# 📚 Tech Stack

| Category         | Technology      |
| ---------------- | --------------- |
| IaC              | Terraform       |
| Cloud Provider   | AWS             |
| Compute          | EC2             |
| Networking       | VPC             |
| Security         | Security Groups |
| Storage          | S3              |
| Operating System | Amazon Linux 2  |

---

# 🎯 Project Goals

This project was built to simulate how infrastructure is designed inside modern cloud engineering and DevOps teams by emphasizing:

* Clean architecture
* Scalability
* Reusability
* Maintainability
* Production-style organization

---

# 👨‍💻 Author

### DevOps Infrastructure Engineering Project

Designed and implemented as a hands-on Terraform + AWS portfolio project demonstrating modular infrastructure provisioning and cloud architecture best practices.

---

# ⭐ Final Thoughts

This repository is intentionally designed to balance:

✅ Simplicity for learning
✅ Production-inspired architecture
✅ Modular scalability
✅ Real-world DevOps practices

It serves as an excellent foundation for expanding into advanced cloud-native and enterprise-grade infrastructure workflows.

---

# 📜 License

This project is open-source and available under the MIT License.
