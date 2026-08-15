variable "aws_region" {
  type        = string
  description = "AWS Region to deploy resources into"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t3.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
  default     = "ami-0b6d9d3d33ba97d99"
}

variable "key_name" {
  type        = string
  description = "AWS Key Pair Name"
  default     = "keyus"
}

variable "public_key_path" {
  type        = string
  description = "Path to the public key file for SSH access"
  default     = "key.pem.pub"
}

variable "instance_name" {
  type        = string
  description = "Name tag for the EC2 instance"
  default     = "MyNewCrete"
}
