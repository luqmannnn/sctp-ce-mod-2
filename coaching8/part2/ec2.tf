module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.name}-${var.environment}-ec2"

  ami = data.aws_ami.al_ami.id
  associate_public_ip_address = true
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.profile_example.name
  key_name      = "${var.name}-key-pair"
  monitoring    = true
  subnet_id     = data.aws_subnet.selected.id

  create_security_group = false
  vpc_security_group_ids = [module.security_group.id]

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.name}-${var.environment}-sg"
  description = "My security group"
  vpc_id      = data.aws_vpc.selected.id

  ingress_rules = {
    ssh = {
      from_port   = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
      description = "SSH from anywhere"
    }
    http = {
      from_port   = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
      description = "HTTP from anywhere"
    }
    self-all = {
      ip_protocol                  = "-1"
      referenced_security_group_id = "self"
      description                  = "All traffic from members of this SG"
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}