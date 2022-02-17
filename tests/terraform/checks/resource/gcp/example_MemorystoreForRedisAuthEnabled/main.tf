
# Passes b/c we enabled AUTH
resource "google_redis_instance" "pass" {
  name           = "my-pass-instance"
  memory_size_gb = 1
  tier           = "STANDARD_HA"

  location_id             = "us-central1-a"
  alternative_location_id = "us-central1-f"
  redis_version           = "REDIS_6_X"

  labels = {
    foo       = "bar"
    yor_trace = "32a316f5-5caa-4feb-a102-076efbaf9f45"
  }

  auth_enabled = true
}

# Fails b/c "auth_enabled" does not exist
# AUTH is not enabled by default
resource "google_redis_instance" "fail1" {
  name           = "my-fail-instance1"
  tier           = "STANDARD_HA"
  memory_size_gb = 1

  location_id             = "us-central1-a"
  alternative_location_id = "us-central1-f"

  redis_version = "REDIS_4_0"
  display_name  = "I am insecure"

  maintenance_policy {
    weekly_maintenance_window {
      day = "TUESDAY"
      start_time {
        hours   = 0
        minutes = 30
        seconds = 0
        nanos   = 0
      }
    }
  }
  labels = {
    yor_trace = "e7670184-0152-49cc-abe4-e688cc2ef3ab"
  }
}

# Fails b/c we turn off AUTH
resource "google_redis_instance" "fail2" {
  name           = "my-fail-instance2"
  memory_size_gb = 1

  auth_enabled = false
  labels = {
    yor_trace = "b5433e09-fb93-4e09-901f-ed61a41b4250"
  }
}
