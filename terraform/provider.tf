terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.15.0"
    }
  }
  
 backend "s3" {
    bucket         = "roboshop-remote-state-01"
    key            = "05-catalogue-dev"
    region         = "us-east-1"
    dynamodb_table = "roboshop-locking"
  }
 
}

provider "aws" {
  region = "us-east-1"
  # Avoid specifying access keys here. Use environment variables or shared credentials files for better security.
}
