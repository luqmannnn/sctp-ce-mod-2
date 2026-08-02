variable "name" {
  description = "The name of the resource"
  type        = string
  default     = "luqman-tf"
}

variable "environment" {
  description = "The environment of the resource"
  type        = string
  default     = "dev"
}

variable "db_subnet_group_name" {
  description = "The DB subnet name to deploy RDS"
  type        = string
  default     = "sctp-vpc-ce13-db-us-east-1a"
}