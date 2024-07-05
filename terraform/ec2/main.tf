terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}

resource "aws_instance" "app_server" {
  ami               = "ami-003c463c8207b4dfa"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-08675481f2991773d"
  key_name          = "ec2-key-1-windows"
  get_password_data = "false"
  tags = {
    Name          = "Terraform-EC2-1"
    resource-type = "ec2"
  }
}

output "private_ip" {
  value      = aws_instance.app_server.private_ip
}

output "private_dns" {
  value = aws_instance.app_server.private_dns
}

output "public_ip" {
  value  = aws_instance.app_server.public_ip
}

output "public_dns" {
  value = aws_instance.app_server.public_dns
}



