terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "luqman-ce13/coaching8/part1/terraform.tfstate"
    region = "us-east-1"
  }
}