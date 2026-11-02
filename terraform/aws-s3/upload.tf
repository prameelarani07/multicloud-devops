# Upload the CloudPilot homepage
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.cloudpilot_website.id
  key          = "index.html"
  source       = "${path.module}/../../index.html"
  content_type = "text/html"
}

# Upload CSS, JavaScript and image assets
resource "aws_s3_object" "assets" {
  for_each = fileset("${path.module}/../../assets", "**")

  bucket = aws_s3_bucket.cloudpilot_website.id
  key    = "assets/${each.value}"
  source = "${path.module}/../../assets/${each.value}"

  content_type = lookup({
    css  = "text/css"
    js   = "application/javascript"
    png  = "image/png"
    jpg  = "image/jpeg"
    jpeg = "image/jpeg"
    svg  = "image/svg+xml"
    webp = "image/webp"
    ico  = "image/x-icon"
  }, element(reverse(split(".", each.value)), 0), "application/octet-stream")
}