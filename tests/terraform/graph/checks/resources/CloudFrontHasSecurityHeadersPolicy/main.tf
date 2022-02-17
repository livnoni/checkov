# pass

resource "aws_cloudfront_distribution" "pass" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.pass.id
  }
  tags = {
    yor_trace = "67e885e4-51b2-4f7a-b917-38caac22a065"
  }
}

resource "aws_cloudfront_response_headers_policy" "pass" {
  name = "test"

  security_headers_config {
    content_security_policy {
      content_security_policy = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'; frame-ancestors 'none'"
      override                = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = true
    }
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection {
      mode_block = true
      override   = true
      protection = true
    }
  }
}

# fail

resource "aws_cloudfront_distribution" "no_response_headers_policy" {
  enabled = true
  tags = {
    yor_trace = "0d6075ad-9878-476d-90ae-4bb0b0105b21"
  }
}

resource "aws_cloudfront_distribution" "no_security_headers_config" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.no_security_headers_config.id
  }
  tags = {
    yor_trace = "11fe9b40-c439-4d4b-833c-97bf6f5b09f0"
  }
}

resource "aws_cloudfront_response_headers_policy" "no_security_headers_config" {
  name = "test"
}

resource "aws_cloudfront_distribution" "incorrect_security_headers_config" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.incorrect_security_headers_config.id
  }
  tags = {
    yor_trace = "bfd8b9aa-7d7e-4926-93ee-a0bfbecb85b5"
  }
}

resource "aws_cloudfront_response_headers_policy" "incorrect_security_headers_config" {
  name = "test"

  security_headers_config {
    content_security_policy {
      content_security_policy = "default-src 'none'"
      override                = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = true
    }
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection {
      mode_block = true
      override   = true
      protection = false
    }
  }
}

resource "aws_cloudfront_distribution" "content_security_policy_missing_default_src_none" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.content_security_policy_missing_default_src_none.id
  }
  tags = {
    yor_trace = "5291ac31-1210-4eba-95cb-acbc63f07583"
  }
}

resource "aws_cloudfront_response_headers_policy" "content_security_policy_missing_default_src_none" {
  name = "test"

  security_headers_config {
    content_security_policy {
      content_security_policy = "default-src 'self' 'unsafe-inline' data: ws: *"
      override                = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = true
    }
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection {
      mode_block = true
      override   = true
      protection = false
    }
  }
}
