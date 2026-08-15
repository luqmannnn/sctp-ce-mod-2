module "zone" {
  source  = "terraform-aws-modules/route53/aws"
  version = "~> 6.4"

  name        = var.domain
  create_zone = false

  records = {
    cloudfront_ipv4 = {
      name = "${var.name}-${var.environment}"
      type = "A"
      alias = {
        name    = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
        zone_id = "Z2FDTNDATAQYW2"
      }
    }
  }
}