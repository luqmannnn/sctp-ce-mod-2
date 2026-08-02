module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "${var.name}-bookinventory"
  hash_key = "ISBN"
  range_key = "Genre"

  attributes = [
    {
      name = "ISBN"
      type = "S"
    },
    {
      name = "Genre"
      type = "S"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}