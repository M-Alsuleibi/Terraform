terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {

region = "eu-west-2"
}


resource "aws_eip" "example" {
  domain = "vpc"
}

output "test" {

    value = aws_eip.example.public_ip
}