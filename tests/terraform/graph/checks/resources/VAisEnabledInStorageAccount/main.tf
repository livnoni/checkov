resource "azurerm_resource_group" "okExample" {
  name     = "okExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "89883433-1190-4e98-9137-3e59b3edbeb7"
  }
}

resource "azurerm_sql_server" "okExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okExample.name
  location                     = azurerm_resource_group.okExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "c0f7671f-1f51-4f98-b454-1bac79d7d72a"
  }
}

resource "azurerm_storage_account" "okExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okExample.name
  location                 = azurerm_resource_group.okExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "ad152717-58d9-4e67-a536-d9689ff50175"
  }
}

resource "azurerm_storage_container" "okExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okExample" {
  resource_group_name = azurerm_resource_group.okExample.name
  server_name         = azurerm_sql_server.okExample.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "okExample" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.okExample.id
  storage_container_path          = "${azurerm_storage_account.okExample.primary_blob_endpoint}${azurerm_storage_container.okExample.name}/"
  storage_account_access_key      = azurerm_storage_account.okExample.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}

resource "azurerm_resource_group" "badExample" {
  name     = "database-rg"
  location = "West Europe"
  tags = {
    yor_trace = "8b0bcbbf-96b8-45ee-a25f-a873a645c23b"
  }
}

resource "azurerm_storage_account" "badExample" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.badExample.name
  location                 = azurerm_resource_group.badExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "fb2884b7-2a64-4806-9d35-0acdb0c91e4f"
  }
}

resource "azurerm_sql_server" "badExample" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.badExample.name
  location                     = azurerm_resource_group.badExample.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.badExample.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.badExample.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = {
    environment = "production"
    yor_trace   = "33ff2d47-73bf-4c58-a5ca-1b67f95f487c"
  }
}


resource "azurerm_storage_container" "badExampleNotEnabled" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.badExampleNotEnabled.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "badExampleNotEnabled" {
  resource_group_name = azurerm_resource_group.badExampleNotEnabled.name
  server_name         = azurerm_sql_server.badExampleNotEnabled.name
  state               = "NotEnabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "badExampleNotEnabled" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.badExampleNotEnabled.id
  storage_container_path          = "${azurerm_storage_account.badExampleNotEnabled.primary_blob_endpoint}${azurerm_storage_container.okExample.name}/"
  storage_account_access_key      = azurerm_storage_account.badExampleNotEnabled.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}