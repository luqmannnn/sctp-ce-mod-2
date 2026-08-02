terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "luqman-ce13/lesson2-5/terraform.tfstate"
    region = "us-east-1"
  }
}