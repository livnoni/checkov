resource "google_dns_managed_zone" "private1" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  labels = {
    yor_trace = "10e9b0f0-92d1-4527-ace2-a5add529f462"
  }
}

resource "google_dns_managed_zone" "private2" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "f38279e1-b8eb-4f79-a7f9-72de004ccfc8"
  }
}

resource "google_dns_managed_zone" "private3" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  dnssec_config {
    state = "off"
  }

  labels = {
    yor_trace = "128534a3-60a9-4634-b8e6-372f7019c021"
  }
}

resource "google_dns_managed_zone" "pass1" {
  # Pass because visibility is public and value is set
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "5896b4c7-df1a-450b-a38d-5ce4e8b417c0"
  }
}

resource "google_dns_managed_zone" "pass2" {
  # Pass because visibility is public (by default) and value is set
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "40817cda-0241-4a0f-96fa-bfff632f1e2f"
  }
}

resource "google_dns_managed_zone" "fail1" {
  # Fail because visibility is public and dnssec block is missing
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

  labels = {
    yor_trace = "aa38936c-0591-4e86-9ee5-360ec1e10bc2"
  }
}

resource "google_dns_managed_zone" "fail2" {
  # Fail because visibility is public and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"
  dnssec_config {
    state = "off"
  }
  labels = {
    yor_trace = "b28ac991-75cc-4edd-a39f-b62bbc195d44"
  }
}

resource "google_dns_managed_zone" "fail3" {
  # Fail because visibility is public (by default) and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "off"
  }
  labels = {
    yor_trace = "f5b3f771-949c-417c-89e2-9d2c5e63710d"
  }
}