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

variable "aliases" {
  description = "The aliases for the CloudFront distribution"
  type        = list(any)
  default     = []
}

variable "web_acl_id" {
  description = "The Web ACL ID for the CloudFront distribution"
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  description = "The ACM certificate ARN for the CloudFront distribution"
  type        = string
  default     = ""
}