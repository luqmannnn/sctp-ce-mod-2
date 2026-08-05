terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "luqman-ce13/lesson2-7.tfstate"
    region = "us-east-1"
  }
}