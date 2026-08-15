resource "aws_wafv2_web_acl" "cloudfront" {
  #checkov:skip=CKV2_AWS_31:Ensure WAF2 has a Logging Configuration
  name  = "${var.name}-waf-${var.environment}"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.name}-waf-${var.environment}-metrics"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "${var.name}-CommonRuleSet-${var.environment}"
    priority = 0
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.name}-CommonRuleSet-${var.environment}-metrics"
      sampled_requests_enabled   = true
    }
  }
}