terraform {
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

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
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
