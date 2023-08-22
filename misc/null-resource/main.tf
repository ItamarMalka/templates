terraform {
  required_version = "~>0.15.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.41.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "null" {
}

resource "aws_instance" "example" {
     ami = data.aws_ami.ubuntu.id
     instance_type = "t2.micro"
     availability_zone = var.availability_zone

lifecycle {
     ignore_changes = [ami]
     }
 }
