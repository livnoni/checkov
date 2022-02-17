provider "aws" {
  region = "eu-west-2"
}

resource "aws_api_gateway_domain_name" "fail" {
  security_policy = "TLS_1_0"
  domain_name     = "api.freebeer10.com"
  tags = {
    yor_trace = "6b0d3077-13f6-45fb-bbf7-45ee0f713247"
  }
}

resource "aws_api_gateway_domain_name" "pass" {
  security_policy = "TLS_1_2"
  domain_name     = "api.freebeer12.com"
  tags = {
    yor_trace = "89da8263-6e3b-48a1-922e-43e241d382a1"
  }
}
