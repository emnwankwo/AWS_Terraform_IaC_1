terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_security_group" "Ec2_security1" {
  name        = "TerraformEc2_security1"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-05ae32088bccb6d55"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    git_commit           = "1c16defd89cc698b658bc79e8a6ee9e284761c21"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-14 01:04:21"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PANW-Learning"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "2a10eeb6-f4ba-4bc6-828e-fe1deb6a024d"
  }
}

resource "aws_instance" "Prisma_Cloud_demo_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    git_commit           = "307ae113731e66f43418501757ef9af03ed2eb8d"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-14 01:01:36"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PANW-Learning"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "049e88b4-d021-42a6-b6c2-c187b1df3151"
  }
}
