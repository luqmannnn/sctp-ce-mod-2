resource "aws_s3_bucket" "bucket1" {
  bucket        = "luqman-s3-bucket-150726-1" #Use a globally unique name
  force_destroy = true
}