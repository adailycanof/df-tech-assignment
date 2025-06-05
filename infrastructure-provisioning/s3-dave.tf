# Bucket 1: "Dave" with versioning disabled
resource "aws_s3_bucket" "dave_bucket" {
  bucket = "dave"

  tags = {
    Name        = "Dave Bucket"
    Environment = "Development"
    Purpose     = "General Storage"
  }
}

resource "aws_s3_bucket_versioning" "dave_bucket_versioning" {
  bucket = aws_s3_bucket.dave_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "dave_bucket_pab" {
  bucket = aws_s3_bucket.dave_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}