resource "azurerm_resource_group" "okLegacyExample" {
  name     = "okLegacyExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "08321284-9405-4cbf-8415-81525260d08a"
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
    yor_trace = "324cf989-fa5c-4eb2-b4e9-622fca7837bc"
  }
}

resource "azurerm_storage_account" "okLegacyExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okLegacyExample.name
  location                 = azurerm_resource_group.okLegacyExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "7d0b971e-2ce5-4f1c-a5f8-b802108b9bba"
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
    yor_trace = "8ef1aa2b-26b1-4104-ab6f-7fadea56c86a"
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
    yor_trace = "1404d62b-804a-4d7c-9cfc-12298931ffe4"
  }
}

resource "azurerm_storage_account" "okExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okExample.name
  location                 = azurerm_resource_group.okExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "25716d81-accb-499c-b943-c28952f7d8ae"
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
    yor_trace = "f6b99e72-52f2-4573-baf5-65bd38252746"
  }
}

resource "azurerm_storage_account" "badExample" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.badExample.name
  location                 = azurerm_resource_group.badExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "6065e747-b382-4503-b30c-af0f40657ac0"
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
    yor_trace   = "8fed6643-f49c-4724-a42b-18528b98b445"
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
  storage_container_path          = "${azurerm_storage_account.badExampleNotEnabled.primary_blob_endpoint}${azurerm_storage_container.okExample.name}/"
  storage_account_access_key      = azurerm_storage_account.badExampleNotEnabled.primary_access_key

  recurring_scans {
    enabled                   = false
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}