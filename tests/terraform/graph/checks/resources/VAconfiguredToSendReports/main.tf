resource "azurerm_resource_group" "okLegacyExample" {
  name     = "okLegacyExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "054a17f1-e624-4d57-adfa-f270276b7f5c"
  }
}

resource "azurerm_sql_server" "okLegacyExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okLegacyExample.name
  location                     = azurerm_resource_group.okLegacyExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "939586b5-870c-41a7-84cf-db2bfaa80a3a"
  }
}

resource "azurerm_storage_account" "okLegacyExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okLegacyExample.name
  location                 = azurerm_resource_group.okLegacyExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "0cf54ed7-854d-4f3f-bcdd-ca795cc7861a"
  }
}

resource "azurerm_storage_container" "okLegacyExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okLegacyExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okLegacyExample" {
  resource_group_name = azurerm_resource_group.okLegacyExample.name
  server_name         = azurerm_sql_server.okLegacyExample.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "okLegacyExample" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.okLegacyExample.id
  storage_container_path          = "${azurerm_storage_account.okLegacyExample.primary_blob_endpoint}${azurerm_storage_container.okLegacyExample.name}/"
  storage_account_access_key      = azurerm_storage_account.okLegacyExample.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}

resource "azurerm_resource_group" "okExample" {
  name     = "okExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "d4d29f79-9cd2-4c24-af9e-ff887d409bbf"
  }
}

resource "azurerm_mssql_server" "okExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okExample.name
  location                     = azurerm_resource_group.okExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "8c613945-f4c0-44f2-885c-d42a227bf344"
  }
}

resource "azurerm_storage_account" "okExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okExample.name
  location                 = azurerm_resource_group.okExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "9ae9f835-acce-45dc-8400-bac0625e63c0"
  }
}

resource "azurerm_storage_container" "okExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okExample" {
  resource_group_name = azurerm_resource_group.okExample.name
  server_name         = azurerm_mssql_server.okExample.name
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
    yor_trace = "e5e7c1f6-a494-4357-a5e9-01e06b235e84"
  }
}

resource "azurerm_storage_account" "badExample" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.badExample.name
  location                 = azurerm_resource_group.badExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "5560806e-7bc0-4a47-a269-59a90940b96b"
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
    yor_trace   = "b878ab06-8f32-4221-9584-6d5fc99fe608"
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
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "badExampleNotEnabled" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.badExampleNotEnabled.id
  storage_container_path          = "${azurerm_storage_account.badExampleNotEnabled.primary_blob_endpoint}${azurerm_storage_container.badExampleNotEnabled.name}/"
  storage_account_access_key      = azurerm_storage_account.badExampleNotEnabled.primary_access_key

  recurring_scans {
    enabled                   = false
    email_subscription_admins = false
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}
