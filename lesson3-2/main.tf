provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce11-tfstate"
    key    = "luqman-s3-tf-ci.tfstate" #Change this
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }

  required_version = ">= 1.0.0"
}

data "aws_caller_identity" "current" {}

locals {
  name_prefix = split("/", data.aws_caller_identity.current.arn)[1]
  account_id  = data.aws_caller_identity.current.account_id
}


resource "aws_s3_bucket" "s3_tf" {
  # checkov:skip=CKV_AWS_145: Skipping KMS encryption for demo
  # checkov:skip=CKV_AWS_18: Skipping access logging for demo
  # checkov:skip=CKV2_AWS_62: Skipping event notifications for demo
  # checkov:skip=CKV2_AWS_61: Skipping lifecycle configuration for demo
  # checkov:skip=CKV_AWS_21: Skipping versioning for demo
  # checkov:skip=CKV_AWS_144: Skipping cross-region replication for demo
  bucket = "${local.name_prefix}-s3-tf-bkt-${local.account_id}"
}

resource "aws_s3_bucket_public_access_block" "s3_tf_block" {
  bucket                  = aws_s3_bucket.s3_tf.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}