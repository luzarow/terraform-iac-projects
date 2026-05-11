# Terraform AWS EC2 Infrastructure Lab

A production-style Infrastructure as Code (IaC) project built with Terraform to provision and manage AWS infrastructure using modular and organized Terraform configurations.

This project demonstrates foundational DevOps and cloud engineering practices including Terraform workflows, AWS resource provisioning, infrastructure modularization, state management, and reusable configuration design.

---

# Project Overview

This Terraform project provisions:

* AWS EC2 Instance
* AWS Security Group
* Default VPC and Subnet integration
* Apache Web Server installation using EC2 User Data
* Dynamic AMI lookup using Terraform Data Sources
* Output values for infrastructure visibility

The project follows Terraform best practices by separating infrastructure into multiple logical configuration files for maintainability and scalability.

---

# Architecture

```text
Terraform Configuration
        │
        ▼
AWS Provider
        │
        ▼
┌─────────────────────────────┐
│       AWS Infrastructure    │
├─────────────────────────────┤
│  Default VPC                │
│  Default Subnet             │
│  Security Group             │
│  EC2 Instance               │
│  Apache HTTP Server         │
└─────────────────────────────┘
```

---

# Project Structure

```text
terraform-lab/
│
├── main.tf
├── variables.tf
├── data.tf
├── security.tf
├── ec2.tf
├── outputs.tf

```

---

# Terraform Configuration Breakdown

| File                | Purpose                                    |
| ------------------- | ------------------------------------------ |
| `main.tf`           | Configures Terraform and AWS provider      |
| `variables.tf`      | Defines reusable input variables           |
| `data.tf`           | Fetches existing AWS resources dynamically |
| `security.tf`       | Creates AWS Security Group                 |
| `ec2.tf`            | Creates and configures EC2 instance        |
| `outputs.tf`        | Displays infrastructure outputs            |

---

# Features

* Infrastructure as Code using Terraform
* AWS Provider integration
* Dynamic AMI retrieval
* Reusable variable-based configuration
* Security Group management
* Automated Apache installation with User Data
* Terraform state management
* Infrastructure planning and lifecycle management
* Environment-ready directory structure

---

# Technologies Used

* Terraform
* AWS EC2
* AWS VPC
* AWS Security Groups
* Linux
* Apache HTTP Server
* HashiCorp Configuration Language (HCL)

---

# Prerequisites

Before running this project, ensure the following are installed and configured:

* Terraform >= 1.0
* AWS CLI
* AWS Account with programmatic access
* Linux-based system or WSL
* Configured AWS credentials

---

# Installation

## Clone Repository

```bash
git clone https://github.com/your-username/terraform-aws-ec2-lab.git
cd terraform-aws-ec2-lab
```

---

# Configure AWS Credentials

```bash
aws configure
```

Provide:

* AWS Access Key ID
* AWS Secret Access Key
* AWS Region
* Output format

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Format Terraform Files

```bash
terraform fmt
```

---

## Generate Execution Plan

```bash
terraform plan
```

---

## Apply Infrastructure

```bash
terraform apply
```

---

## View Outputs

```bash
terraform output
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Infrastructure Resources Created

## AWS EC2 Instance

* Amazon Linux 2
* Apache Web Server
* Public IP enabled
* User Data bootstrapping

---

## AWS Security Group

Allows:

* SSH (Port 22)
* HTTP (Port 80)

---

# Example User Data Configuration

The EC2 instance automatically:

* Updates system packages
* Installs Apache HTTP Server
* Starts and enables Apache service
* Creates a sample HTML page

---

# Terraform Concepts Demonstrated

This project demonstrates practical implementation of:

* Infrastructure as Code (IaC)
* Terraform Providers
* Variables
* Data Sources
* Resources
* Outputs
* Dependency Graphs
* State Management
* Infrastructure Lifecycle Management

---

# Security Considerations

This project is intended for learning and demonstration purposes.

For production environments:

* Restrict SSH access to trusted IP ranges
* Use IAM Roles instead of static credentials
* Store Terraform state remotely
* Enable state locking
* Use private subnets where applicable
* Implement least privilege IAM policies

---

# Learning Outcomes

Through this project, the following DevOps and Cloud Engineering concepts are practiced:

* Terraform project structuring
* AWS infrastructure provisioning
* Infrastructure automation
* Declarative infrastructure management
* Resource dependency handling
* Cloud security fundamentals
* Infrastructure lifecycle operations

---

# Future Improvements

Potential enhancements include:

* Remote backend using S3
* DynamoDB state locking
* Terraform modules
* Multi-environment deployments
* CI/CD integration
* Auto Scaling Groups
* Load Balancer integration
* VPC customization
* Monitoring with CloudWatch

---

# Screenshots / Outputs

Example Terraform output:

```bash
instance_public_ip = "x.x.x.x"
website_url        = "http://x.x.x.x"
```

---

# Author

**Your Name**
DevOps & Cloud Engineering Enthusiast

---

# License

This project is licensed under the MIT License.

---

# Acknowledgements

* HashiCorp Terraform
* Amazon Web Services (AWS)
* Infrastructure as Code Community
