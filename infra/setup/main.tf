terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "aha-devops-recipe-app-tf-state"
    key            = "tf-state-setup"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "aha-devops-recipe-app-api-tf-lock"

  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    Environment = terraform.workspace
    Project     = var.project
    contact     = var.contact
    ManageBy    = "Terraform/setup"
  }
}