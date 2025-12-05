# Create B2 bucket for static website
resource "b2_bucket" "static_website" {
  bucket_name = "${var.project_name}-${var.environment}-website"
  type        = "allPublic"
  
  # CORS configuration for web applications
  cors_rules {
    cors_rule_name    = "allow-all-origins"
    allowed_origins   = ["*"]
    allowed_operations = [
      "b2_download_file_by_name",
      "b2_upload_file"
    ]
    allowed_headers = ["*"]
    max_age_seconds = 3600
  }
}

# Create application key for CI/CD deployments
resource "b2_application_key" "ci_cd_key" {
  key_name = "${var.project_name}-ci-cd-${var.environment}"
  capabilities = [
    "listBuckets",
    "listFiles",
    "readFiles",
    "writeFiles",
    "deleteFiles"
  ]
}

# Bucket for file uploads (for future features)
resource "b2_bucket" "uploads" {
  bucket_name = "${var.project_name}-${var.environment}-uploads"
  type        = "allPrivate"
}resource "b2_bucket" "this" {
  bucket_name = var.bucket_name
  type        = var.bucket_type

  dynamic "cors_rules" {
    for_each = var.cors_enabled ? [1] : []
    
    content {
      cors_rule_name    = "web-cors-rule"
      allowed_origins   = var.cors_allowed_origins
      allowed_operations = [
        "b2_download_file_by_name",
        "b2_upload_file"
      ]
      allowed_headers = ["*"]
      max_age_seconds = 3600
    }
  }
}