# AWS EC2 Infrastructure with Terraform

This repository contains Terraform configuration files to provision an AWS EC2 instance along with its associated Key Pair, Security Group, and Default VPC setup in the `us-east-1` region.

## Project Structure

```text
├── ec2.tf                 # Defines Key Pair, Default VPC, Security Group, and EC2 instance
├── providr.tf             # Configures the AWS provider and target region (us-east-1)
├── .terraform.lock.hcl    # Terraform provider lock file
├── key.pem.pub            # Public key file used for EC2 Key Pair resource
├── README.md              # Project documentation
└── .gitignore             # Excludes state files, cache, and private keys from Git
```

## Infrastructure Resources

1. **AWS Key Pair (`aws_key_pair.keyus`)**:
   - Creates an EC2 SSH key pair named `keyus` using `key.pem.pub`.

2. **Default VPC (`aws_default_vpc.default`)**:
   - References the default VPC in the AWS account for resource placement.

3. **Security Group (`aws_security_group.my_sg`)**:
   - **Ingress Port 22 (SSH)**: Allows SSH access from any IP (`0.0.0.0/0`).
   - **Ingress Port 80 (HTTP)**: Allows web traffic on port 80 from any IP (`0.0.0.0/0`).
   - **Egress**: Allows all outbound traffic.

4. **EC2 Instance (`aws_instance.mynewcrete`)**:
   - **Name Tag**: `MyNewCrete`
   - **Instance Type**: `t3.micro`
   - **AMI**: `ami-0b6d9d3d33ba97d99`
   - **Associated Resources**: Attached to `keyus` Key Pair and `my_sg` Security Group.

---

## Security Notes

> [!IMPORTANT]
> The private SSH key (`key.pem`) and Terraform local state files (`*.tfstate`) are intentionally ignored via `.gitignore` to prevent sensitive credentials and state data from being committed to version control.

---

## Prerequisites

- [Terraform CLI](https://www.terraform.io/downloads) (v1.0+)
- AWS CLI configured with appropriate IAM credentials (`aws configure`)
- SSH keypair public file (`key.pem.pub`) in the project directory

---

## Usage Instructions

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Review Infrastructure Plan**:
   ```bash
   terraform plan
   ```

3. **Deploy Resources**:
   ```bash
   terraform apply
   ```

4. **Clean Up Resources**:
   ```bash
   terraform destroy
   ```
