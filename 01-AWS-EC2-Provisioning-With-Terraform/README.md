# Terraform AWS Infrastructure Provisioning with EC2

Production-oriented Infrastructure as Code (IaC) project using Terraform to provision and manage AWS infrastructure in a structured, scalable, and maintainable manner.

This project demonstrates foundational cloud engineering and DevOps practices including Terraform-based infrastructure provisioning, AWS resource management, configuration modularization, state management, reusable variables, and automated EC2 bootstrapping.

---

# Overview

This repository contains Terraform configurations for deploying AWS infrastructure components required to provision a Linux-based EC2 instance with automated web server configuration.

The project is designed to reflect real-world Infrastructure as Code workflows and Terraform project organization standards commonly used in DevOps and cloud engineering environments.

---

# Infrastructure Components

The following AWS resources are provisioned and managed through Terraform:

* EC2 Instance
* Security Group
* Default VPC Integration
* Default Subnet Integration
* Dynamic Amazon Linux 2 AMI Lookup
* Apache HTTP Server Installation via User Data

---

# Architecture

```text id="z48fr2"
Terraform Configuration
        │
        ▼
Terraform AWS Provider
        │
        ▼
┌───────────────────────────────────┐
│          AWS Infrastructure       │
├───────────────────────────────────┤
│  Default VPC                      │
│  Default Subnet                   │
│  Security Group                   │
│  EC2 Instance                     │
│  Apache HTTP Server               │
└───────────────────────────────────┘
```

---

# Repository Structure

```text id="sov2ow"
terraform-aws-ec2-lab/
│
├── main.tf
├── variables.tf
├── data.tf
├── security.tf
├── ec2.tf
├── outputs.tf

```

---

# Configuration Design

| File           | Responsibility                       |
| -------------- | ------------------------------------ |
| `main.tf`      | Terraform and provider configuration |
| `variables.tf` | Input variable declarations          |
| `data.tf`      | Existing AWS resource discovery      |
| `security.tf`  | Security Group definitions           |
| `ec2.tf`       | EC2 instance provisioning            |
| `outputs.tf`   | Infrastructure output values         |

---

# Key Technical Implementations

## Infrastructure as Code (IaC)

Infrastructure provisioning and lifecycle management are fully automated using declarative Terraform configurations.

---

## Dynamic Resource Discovery

Terraform Data Sources are used to dynamically retrieve:

* Latest Amazon Linux 2 AMI
* Default AWS VPC
* Default Subnet

This approach avoids hardcoded infrastructure values and improves portability and maintainability.

---

## Automated EC2 Bootstrapping

The EC2 instance uses User Data scripts to automatically:

* Update system packages
* Install Apache HTTP Server
* Enable and start services
* Deploy a basic web page

---

## Resource Dependency Management

Terraform automatically builds and manages resource dependency graphs between:

* VPC
* Subnet
* Security Group
* EC2 Instance

This ensures infrastructure is provisioned in the correct order.

---

# Technologies Used

| Technology          | Purpose                          |
| ------------------- | -------------------------------- |
| Terraform           | Infrastructure provisioning      |
| AWS EC2             | Compute resources                |
| AWS VPC             | Networking                       |
| AWS Security Groups | Network access control           |
| HCL                 | Terraform configuration language |
| Linux               | Operating system environment     |
| Apache HTTP Server  | Web server                       |

---

# Prerequisites

The following are required before deployment:

* Terraform >= 1.0
* AWS CLI
* AWS Account
* IAM User with programmatic access
* Configured AWS credentials
* Linux/WSL environment

---

# AWS Credential Configuration

Configure AWS credentials locally:

```bash id="d70s1l"
aws configure
```

Required inputs:

* AWS Access Key ID
* AWS Secret Access Key
* Default Region
* Output Format

---

# Deployment Workflow

## Initialize Terraform

```bash id="a1zth7"
terraform init
```

Downloads required provider plugins and initializes the working directory.

---

## Validate Configuration

```bash id="pc3lsk"
terraform validate
```

Performs syntax and configuration validation.

---

## Format Configuration Files

```bash id="5f2mw0"
terraform fmt
```

Applies standard Terraform formatting conventions.

---

## Generate Execution Plan

```bash id="5lmv3p"
terraform plan
```

Displays infrastructure changes before deployment.

---

## Provision Infrastructure

```bash id="8pnjmh"
terraform apply
```

Creates infrastructure resources within AWS.

---

## Retrieve Outputs

```bash id="1mr9dk"
terraform output
```

Displays generated infrastructure outputs including public IP and DNS.

---

## Destroy Infrastructure

```bash id="xtlb1e"
terraform destroy
```

Removes all Terraform-managed infrastructure resources.

---

# Example Outputs

```bash id="d4m3hv"
instance_id         = "i-xxxxxxxxxxxxx"
instance_public_ip  = "x.x.x.x"
instance_public_dns = "ec2-x-x-x-x.compute.amazonaws.com"
website_url         = "http://x.x.x.x"
```

---

# Terraform Concepts Demonstrated

This project demonstrates practical implementation of:

* Infrastructure as Code (IaC)
* Terraform Providers
* Terraform Variables
* Terraform Data Sources
* Terraform Resources
* Terraform Outputs
* Terraform State Management
* Dependency Resolution
* Declarative Infrastructure Provisioning

---

# Security Notes

This project is intended for educational and demonstration purposes.

Current security group rules allow inbound access from all IP addresses:

* SSH (22)
* HTTP (80)

For production-grade environments:

* Restrict SSH access using trusted CIDR ranges
* Use IAM Roles instead of static credentials
* Store Terraform state remotely
* Enable state locking
* Use private networking architecture
* Implement least-privilege IAM policies

---

# Engineering Best Practices Applied

* Logical Terraform file separation
* Reusable variable-driven configuration
* Dynamic infrastructure lookup
* Declarative infrastructure provisioning
* Infrastructure lifecycle management
* Consistent resource tagging
* Environment-ready repository structure

---

# Future Enhancements

Potential enterprise-level improvements include:

* Remote backend using Amazon S3
* State locking with DynamoDB
* Terraform module abstraction
* Multi-environment deployments
* CI/CD integration
* Auto Scaling Groups
* Load Balancer integration
* Custom VPC implementation
* Monitoring and observability integration
* Infrastructure policy enforcement

---

# Learning Objectives

This project reinforces practical understanding of:

* Terraform workflows
* AWS infrastructure automation
* Infrastructure state management
* Cloud networking fundamentals
* Infrastructure dependency modeling
* Automated provisioning strategies
* DevOps engineering practices

---

# Author

**Abdul Mateen**
DevOps Engineer | Cloud Infrastructure Enthusiast

---

# License

This project is licensed under the MIT License.

---

# References

* Terraform by HashiCorp
* Amazon Web Services (AWS)
* Infrastructure as Code (IaC) Principles
