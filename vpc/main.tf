terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.35.0"
    }
  }
}

provider "aws" {
  access_key = "local"
  secret_key = "local"
  region = var.region

  s3_use_path_style = false
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true

  endpoints {
    ec2 = "http://localhost:4566"
  }
}

resource "aws_vpc" "custom-a4l" {
  cidr_block = "10.16.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "a4l-vpc1"
  }
}