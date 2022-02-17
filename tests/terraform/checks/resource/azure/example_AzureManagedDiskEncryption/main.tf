resource "azurerm_managed_disk" "fail" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  encryption_settings {
    enabled = false
  }
  tags = merge(var.common_tags, {
    yor_trace = "41787362-f32f-42a0-9d0f-329242c50a97"
  })
}

resource "azurerm_managed_disk" "fail2" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  encryption_settings = {
    enabled = false
  }

  tags = {
    environment = "staging"
    yor_trace   = "81fa8b4f-37af-4a79-8173-6563b68aa72a"
  }
}
resource "azurerm_managed_disk" "pass3" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags = merge(var.common_tags, {
    yor_trace = "54923700-8a88-44d8-8e94-296657cfd3d5"
  })
}

resource "azurerm_managed_disk" "pass2" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  encryption_settings {
    enabled = true
  }
  tags = merge(var.common_tags, {
    yor_trace = "cbd4098e-4165-45e7-881a-15dd69d9f32d"
  })
}

resource "azurerm_managed_disk" "pass" {
  name                   = "acctestmd1"
  location               = "West US 2"
  resource_group_name    = azurerm_resource_group.example.name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  disk_encryption_set_id = var.encryption_set_id

  tags = {
    environment = "staging"
    yor_trace   = "383a5d0d-fdc5-435f-b9a0-f323768ed550"
  }
}


