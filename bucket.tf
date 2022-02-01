# creating a bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "endija-spainis"
  acl    = "private"

  tags = {
    Name        = "Endija-spainis"
    Environment = "Dev"
  }
}