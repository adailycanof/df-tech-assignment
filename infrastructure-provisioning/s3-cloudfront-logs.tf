# Bucket 3: "cloudfront-logs" with versioning disabled and CloudFront logs configuration
resource "aws_s3_bucket" "cloudfront_logs_bucket" {
  bucket = "cloudfront-logs"

  tags = {
    Name        = "CloudFront Logs Bucket"
    Environment = "Development"
    Purpose     = "CloudFront Access Logs"
  }
}

resource "aws_s3_bucket_versioning" "cloudfront_logs_bucket_versioning" {
  bucket = aws_s3_bucket.cloudfront_logs_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

# CloudFront logs bucket policy to allow CloudFront to write logs
resource "aws_s3_bucket_policy" "cloudfront_logs_bucket_policy" {
  bucket = aws_s3_bucket.cloudfront_logs_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = [
          "s3:PutObject",
          "s3:GetBucketAcl",
          "s3:PutBucketAcl"
        ]
        Resource = [
          "${aws_s3_bucket.cloudfront_logs_bucket.arn}",
          "${aws_s3_bucket.cloudfront_logs_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "cloudfront_logs_bucket_pab" {
  bucket = aws_s3_bucket.cloudfront_logs_bucket.id

  block_public_acls       = true
  block_public_policy     = false # Allow policy for CloudFront
  ignore_public_acls      = true
  restrict_public_buckets = false # Allow CloudFront access
}

# Configure lifecycle rules for CloudFront logs bucket
resource "aws_s3_bucket_lifecycle_configuration" "cloudfront_logs_lifecycle" {
  bucket = aws_s3_bucket.cloudfront_logs_bucket.id

  rule {
    id     = "delete_old_logs"
    status = "Enabled"

    expiration {
      days = 90 # Delete logs older than 90 days
    }

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}