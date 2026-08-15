resource "aws_key_pair" "keyus" {
  key_name   = "keyus"
  public_key = file("key.pem.pub")

}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "My security group"
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
  }

}

resource "aws_instance" "mynewcrete" {
  ami             = "ami-0b6d9d3d33ba97d99"
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.keyus.key_name
  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = "MyNewCrete"
  }

}