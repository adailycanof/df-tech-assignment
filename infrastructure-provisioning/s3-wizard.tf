# Bucket 2: "wizards" with versioning enabled
resource "aws_s3_bucket" "wizards_bucket" {
  bucket = "wizards"

  tags = {
    Name        = "Wizards Bucket"
    Environment = "Development"
    Purpose     = "Version Controlled Storage"
  }
}

resource "aws_s3_bucket_versioning" "wizards_bucket_versioning" {
  bucket = aws_s3_bucket.wizards_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "wizards_bucket_pab" {
  bucket = aws_s3_bucket.wizards_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}