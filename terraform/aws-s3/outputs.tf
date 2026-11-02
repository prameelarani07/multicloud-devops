output "s3_bucket_name" {
  description = "CloudPilot S3 website bucket"
  value       = aws_s3_bucket.cloudpilot_website.id
}

output "s3_website_endpoint" {
  description = "CloudPilot static website URL"
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}