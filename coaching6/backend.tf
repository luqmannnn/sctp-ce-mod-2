terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "luqman-ce13/coaching6/luqman-tf-coaching-6.tfstate"
    region = "us-east-1"
  }
}