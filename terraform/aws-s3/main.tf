# Create an S3 bucket for CloudPilot website
resource "aws_s3_bucket" "cloudpilot_website" {
  bucket = "cloudpilot-website-prameelarani07"

  tags = {
    Name        = "CloudPilot Static Website"
    Environment = "Project"
  }
}

# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.cloudpilot_website.id

  index_document {
    suffix = "index.html"
  }
}

# Allow public access through the bucket policy
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.cloudpilot_website.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

# Set bucket policy for public website access
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.cloudpilot_website.id

  depends_on = [
    aws_s3_bucket_public_access_block.website
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.cloudpilot_website.arn}/*"
      }
    ]
  })
}