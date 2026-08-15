module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 6.3"

  domain_name       = "${var.name}-${var.environment}.${var.domain}"
  zone_id           = data.aws_route53_zone.prod.zone_id
  validation_method = "DNS"
}

