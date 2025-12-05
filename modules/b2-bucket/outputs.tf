output "website_url" {
  description = "URL to access the static website"
  value       = "https://${b2_bucket.static_website.bucket_name}.s3.us-west-002.backblazeb2.com/index.html"
}

output "bucket_name" {
  description = "Name of the created B2 bucket"
  value       = b2_bucket.static_website.bucket_name
}

output "cdn_ready_url" {
  description = "Base URL for CDN configuration"
  value       = "${b2_bucket.static_website.bucket_name}.s3.us-west-002.backblazeb2.com"
}

output "upload_bucket_name" {
  description = "Name of the uploads bucket"
  value       = b2_bucket.uploads.bucket_name
}