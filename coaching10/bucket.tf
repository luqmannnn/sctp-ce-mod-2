resource "aws_s3_bucket" "static_web" {
  bucket_prefix = "${var.name}-${var.environment}-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.static_web.id
  policy = data.aws_iam_policy_document.default.json
}