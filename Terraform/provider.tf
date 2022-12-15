terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1a"
  profile = "terraform-user"
}




# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1b"
  profile = "terraform-user"
}