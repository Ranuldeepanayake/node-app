locals {
  resource_name_prefix = "s3-bucket-ranul"
}

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

resource "random_uuid" "random_uuid_generator" {
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket  = "${local.resource_name_prefix}-${random_uuid.random_uuid_generator.result}"
    tags = {
    resource-type  = "S3"
  }
}
