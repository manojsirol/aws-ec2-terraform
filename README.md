# Automated AWS EC2 Infrastructure with Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0%2B-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazon-aws)
![Security](https://img.shields.io/badge/Security-Strict-green)

A production-grade, modular Terraform configuration designed to provision an **AWS EC2 Instance** with customized SSH Key Pair management, Security Group rules (SSH & HTTP), and Default VPC association in AWS `us-east-1`.

---

## 🔒 Security Policy & Data Protection

> [!IMPORTANT]
> **Strict Credentials & Key Protection**:
> - **Zero Credentials Committed**: AWS Access Keys are passed securely via AWS CLI / Environment Variables.
> - **Private Keys Excluded**: Local private keys (`*.pem`, `*.key`) and public keys (`*.pub`) are strictly excluded via `.gitignore`.
> - **State Protection**: Local Terraform state files (`*.tfstate`) containing sensitive infrastructure state are prevented from being tracked or committed.

---

## 📁 Repository Structure

```text
├── ec2.tf                   # EC2 Instance, Security Group, and Key Pair resource definitions
├── providr.tf               # Terraform AWS Provider & version constraints
├── variables.tf             # Input variable declarations
├── outputs.tf               # Infrastructure outputs (Instance ID, Public IP, SG ID)
├── terraform.tfvars.example # Template variable configuration file
├── .gitignore               # Strict security exclusion rules for Git
└── README.md                # Project documentation
```

---

## 🚀 Infrastructure Resources

| Resource | Terraform Name | Description |
| :--- | :--- | :--- |
| **EC2 Instance** | `aws_instance.mynewcrete` | `t3.micro` instance running target AMI |
| **Security Group** | `aws_security_group.my_sg` | Ingress ports `22` (SSH) & `80` (HTTP), full egress |
| **SSH Key Pair** | `aws_key_pair.keyus` | Key pair registered from local public key |
| **Default VPC** | `aws_default_vpc.default` | Auto-detected default VPC for region deployment |

---

## ⚙️ Input Variables

| Variable | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `aws_region` | `string` | `us-east-1` | Target AWS deployment region |
| `instance_type` | `string` | `t3.micro` | AWS EC2 instance type |
| `ami_id` | `string` | `ami-0b6d9d3d33ba97d99` | Amazon Machine Image ID |
| `key_name` | `string` | `keyus` | Key pair identifier in AWS |
| `public_key_path` | `string` | `key.pem.pub` | Local path to public SSH key |

---

## 🛠️ Quickstart Guide

### 1. Prerequisites
- [Terraform CLI](https://www.terraform.io/downloads) (v1.0+) installed.
- [AWS CLI](https://aws.amazon.com/cli/) installed and authenticated (`aws configure`).
- SSH Public Key file available locally.

### 2. Deployment Steps

```bash
# Clone repository
git clone https://github.com/manojsirol/aws-ec2-terraform.git
cd aws-ec2-terraform

# Initialize Terraform providers
terraform init

# Validate configuration syntax
terraform validate

# Preview infrastructure changes
terraform plan

# Apply infrastructure plan
terraform apply
```

### 3. Cleanup Resources

To destroy all provisioned AWS resources when finished:
```bash
terraform destroy
```
