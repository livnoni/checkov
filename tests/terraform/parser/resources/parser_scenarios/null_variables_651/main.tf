variable "logging_include_cookies" {
  type        = bool
  description = "Whether to enable cookies in access logging"
  default     = null
}

variable "logging_bucket_id" {
  type        = string
  description = "The bucket ID where to store access logs"
  default     = null
}

variable "logging_bucket_prefix" {
  type        = string
  description = "The prefix where to store access logs"
  default     = null
}

resource "aws_cloudfront_distribution" "cf_dis" {
  enabled = true
  logging_config {
    include_cookies = var.logging_include_cookies
    bucket          = var.logging_bucket_id
    prefix          = var.logging_bucket_prefix
  }
  tags = {
    yor_trace = "a84aee60-7289-4adf-99c7-82c9ad871620"
  }
}


resource "aws_s3_bucket" "website_bucket" {
  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "12f4761a-e16c-4d85-aa31-7603178cba89"
  }
}

variable "versioning" {
  default = null
}