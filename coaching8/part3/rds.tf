module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${var.name}-rds"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t4g.micro"
  allocated_storage = 5

  db_name  = "my_db"
  username = "admin"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.rds_security_group.id]

  tags = {
    Owner       = "${var.name}"
    Environment = "${var.environment}"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids = [
    data.aws_subnet.db1_selected.id,
    data.aws_subnet.db2_selected.id,
  ]

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}

module "rds_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.name}-${var.environment}-sg-3"
  description = "My security group"
  vpc_id      = data.aws_vpc.selected.id

  ingress_rules = {
    mysql = {
      from_port                    = 3306
      to_port                      = 3306
      ip_protocol                  = "tcp"
      referenced_security_group_id = module.ec2_security_group.id
      description                  = "MySQL from EC2"
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