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
  region = "ap-southeast-1"
  profile = "default"
}

resource "aws_instance" "app_server" {
  ami           = "ami-003c463c8207b4dfa"
  instance_type = "t2.micro"
  subnet_id = "subnet-08675481f2991773d"
  tags = {
    Name = "Terraform-EC2-1"
  }
}

