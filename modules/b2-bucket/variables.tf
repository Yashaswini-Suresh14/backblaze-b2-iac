variable "bucket_name" {
  description = "Name of the B2 bucket"
  type        = string
}

variable "bucket_type" {
  description = "Type of bucket (allPublic, allPrivate)"
  type        = string
  default     = "allPrivate"
}

variable "cors_enabled" {
  description = "Whether to enable CORS for web applications"
  type        = bool
  default     = false
}

variable "cors_allowed_origins" {
  description = "List of allowed origins for CORS"
  type        = list(string)
  default     = ["*"]
}