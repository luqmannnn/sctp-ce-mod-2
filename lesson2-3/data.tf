data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["*ce13-vpc*"] # to be replaced with your VPC name
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

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["ce13-subnet-public*"] # to be replaced with your public subnet name
  }
}