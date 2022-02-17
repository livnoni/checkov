resource "oci_file_storage_file_system" "pass" {
  availability_domain = var.file_system_availability_domain
  compartment_id      = var.compartment_id

  defined_tags = { "Operations.CostCenter" = "42" }
  display_name = var.file_system_display_name
  freeform_tags = { "Department" = "Finance"
    yor_trace = "b88e03ce-1195-4fca-9d3a-62d50af319e8"
  }
  kms_key_id         = oci_kms_key.test_key.id
  source_snapshot_id = oci_file_storage_snapshot.test_snapshot.id
}


resource "oci_file_storage_file_system" "fail" {
  availability_domain = var.file_system_availability_domain
  compartment_id      = var.compartment_id

  defined_tags = { "Operations.CostCenter" = "42" }
  display_name = var.file_system_display_name
  freeform_tags = { "Department" = "Finance"
    yor_trace = "7b79f89c-67f4-4980-bcaf-916d7e17a5d8"
  }
  source_snapshot_id = oci_file_storage_snapshot.test_snapshot.id
}