resource "azurerm_storage_container" "ok_container_1" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.ok_account_1.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "ok_container_2" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.ok_account_2.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "not_ok_container" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.not_ok_account.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "ok_account_1" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "f3bbb866-48a7-4356-a861-686ff1129f5e"
  }
}

resource "azurerm_storage_account" "ok_account_2" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "44286612-975b-46f6-885f-91afc9943e80"
  }
}

resource "azurerm_storage_account" "not_ok_account" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "a95c2a1e-1d62-4826-9de7-b28f887adbf9"
  }
}

resource "azurerm_monitor_activity_log_alert" "ok_monitor_activity_log_alert_1" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."

  criteria {
    resource_id    = azurerm_storage_account.ok_account_1.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "1db8d3d0-9e44-47f6-be7e-4d0ad090e75b"
  }
}

resource "azurerm_monitor_activity_log_alert" "ok_monitor_activity_log_alert_2" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."
  enabled             = true

  criteria {
    resource_id    = azurerm_storage_account.ok_account_2.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "dccecabd-9e6e-4eb3-b7f0-f0ec0404b2a9"
  }
}

resource "azurerm_monitor_activity_log_alert" "not_ok_monitor_activity_log_alert" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."
  enabled             = false

  criteria {
    resource_id    = azurerm_storage_account.not_ok_account.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "ca1b1728-9aaf-4ecc-bebb-7be2d45ade79"
  }
}