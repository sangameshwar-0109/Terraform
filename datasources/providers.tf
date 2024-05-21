terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.31.0"
    }
  }
  // required_version = "> 1.6.0"

  backend "s3" {
    bucket         = "sangutf"
    key            = "example/modules"
    region         = "us-west-2"
    dynamodb_table = "sangus3"

  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Env       = "Dev"
      CreatedBy = "Terraform"
    }

  }
}