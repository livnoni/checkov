# pass

resource "azurerm_sql_server" "deprecated" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 90
  }
  tags = {
    yor_trace = "ac2a0ce0-669d-45b3-90f8-161dd040f2fb"
  }
}

resource "azurerm_mssql_server" "deprecated" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 90
  }
  tags = {
    yor_trace = "18a20bbf-3426-4b6a-92bd-f997fc6fe7d8"
  }
}

resource "azurerm_mssql_server" "long" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  tags = {
    yor_trace = "c1295571-6396-49da-a522-3dcb1ba9e658"
  }
}

resource "azurerm_mssql_server_extended_auditing_policy" "long" {
  server_id                               = azurerm_mssql_server.long.id
  storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.example.primary_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days                       = 90
}

# fail

resource "azurerm_sql_server" "default" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  tags = {
    yor_trace = "edc5de23-dc4c-4028-8508-d12aaa52f68b"
  }
}

resource "azurerm_mssql_server" "default" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  tags = {
    yor_trace = "cc76de2a-553c-48af-b3b3-cccec9893800"
  }
}

resource "azurerm_mssql_server" "deprecated_too_short" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }
  tags = {
    yor_trace = "d640b104-3ff9-44c9-8bca-37ee956d3fc3"
  }
}

resource "azurerm_mssql_server" "too_short" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  tags = {
    yor_trace = "6f538993-1609-49d1-a0c4-0258a6f9e5c3"
  }
}

resource "azurerm_mssql_server_extended_auditing_policy" "too_short" {
  server_id                               = azurerm_mssql_server.too_short.id
  storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.example.primary_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days                       = 6
}
