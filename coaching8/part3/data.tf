data "aws_subnet" "public_selected" {
  filter {
    name   = "tag:Name"
    values = ["sctp-vpc-ce13-public-*-1a"] # Change accordingly
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["sctp-vpc-ce13"] # Change accordingly
  }
}

data "aws_subnet" "db1_selected" {
  filter {
    name   = "tag:Name"
    values = ["sctp-vpc-ce13-db-*-1a"] # Change accordingly
  }
}

data "aws_subnet" "db2_selected" {
  filter {
    name   = "tag:Name"
    values = ["sctp-vpc-ce13-db-*-1b"] # Change accordingly
  }
}

data "aws_ami" "al_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}