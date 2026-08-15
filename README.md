# AWS EC2 Infrastructure Provisioning with Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0%2B-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazon-aws)

This project demonstrates automated infrastructure provisioning on AWS using Terraform. It sets up an EC2 instance, configures a Security Group allowing SSH and HTTP access, attaches an SSH Key Pair, and associates the deployment with the default VPC in the `us-east-1` region.

---

## 🔒 Security Practices

To ensure this repository remains safe and clean for public version control:
- **No Hardcoded Credentials**: AWS credentials are never stored in Terraform configuration files. Authentication relies on local AWS CLI credentials (`aws configure`) or environment variables (`AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY`).
- **Private Keys & State Files Excluded**: All SSH private keys (`*.pem`, `*.key`), public key files (`*.pub`), and local Terraform state files (`*.tfstate`) are listed in `.gitignore` to prevent sensitive credentials or state data from being pushed to Git.
- **Parametrized Configuration**: Variables are used for configurable parameters (`region`, `instance_type`, `ami_id`), with example defaults provided in `terraform.tfvars.example`.

---

## 📁 Repository Structure

```text
├── ec2.tf                   # Defines EC2 Instance, Security Group, and Key Pair
├── providr.tf               # Configures AWS provider and Terraform versions
├── variables.tf             # Input variable declarations
├── outputs.tf               # Infrastructure outputs (Instance ID, Public IP, SG ID)
├── terraform.tfvars.example # Example variable values template
├── .gitignore               # Excludes state files, cache, and SSH keys
└── README.md                # Project documentation
```

---

## 🚀 Infrastructure Resources

| Resource | Terraform Name | Description |
| :--- | :--- | :--- |
| **EC2 Instance** | `aws_instance.web` | `t3.micro` EC2 instance running target AMI |
| **Security Group** | `aws_security_group.web_sg` | Ingress for SSH (port 22) and HTTP (port 80), full egress |
| **SSH Key Pair** | `aws_key_pair.deployer` | Key pair registered using local public key |
| **Default VPC** | `aws_default_vpc.default` | References default VPC in the selected AWS region |

---

## ⚙️ Input Variables

| Variable | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `aws_region` | `string` | `us-east-1` | AWS region for deployment |
| `instance_type` | `string` | `t3.micro` | AWS EC2 instance type |
| `ami_id` | `string` | `ami-0b6d9d3d33ba97d99` | Amazon Machine Image ID |
| `key_name` | `string` | `deployer-key` | Key pair identifier in AWS |
| `public_key_path` | `string` | `~/.ssh/id_rsa.pub` | Path to your local public SSH key |

---

## 🛠️ Usage Instructions

### 1. Prerequisites
- [Terraform CLI](https://www.terraform.io/downloads) (v1.0+) installed.
- [AWS CLI](https://aws.amazon.com/cli/) configured (`aws configure`).
- A local SSH public key file (e.g., `~/.ssh/id_rsa.pub`).

### 2. Deployment Steps

```bash
# Clone the repository
git clone https://github.com/manojsirol/aws-ec2-terraform.git
cd aws-ec2-terraform

# Initialize Terraform providers
terraform init

# Preview changes
terraform plan

# Apply infrastructure changes
terraform apply
```

### 3. Cleanup Resources

To destroy all created resources when finished:
```bash
terraform destroy
```
