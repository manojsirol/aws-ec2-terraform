resource "aws_key_pair" "keyus" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "Security Group allowing SSH and HTTP access"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

resource "aws_instance" "mynewcrete" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.keyus.key_name
  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = var.instance_name
  }
}