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

resource "aws_instance" "myec2" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = var.map_type["eu-west-2"]

}