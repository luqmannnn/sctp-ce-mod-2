variable "name" {
  description = "The name of the resource"
  type        = string
  default     = "luqman-tf"
}

variable "environment" {
  description = "The environment of the resource"
  type        = string
  default     = "prod"
}

variable "domain" {
  description = "The domain name for the S3 bucket"
  type        = string
  default     = "sctp-sandbox.com"
}