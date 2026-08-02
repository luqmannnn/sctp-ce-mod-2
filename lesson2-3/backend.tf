terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "luqman-ce13/lesson2-3.tfstate"
    region = "us-east-1"
  }
}