data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "2cc720a0-4a54-4fdc-9cf7-0e0d8511e3a9"
  }
}

resource "azurerm_sql_server" "sql_server_good" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "6644f7d4-8af9-4d24-b3b6-54ac49924fe8"
  }
}

resource "azurerm_sql_server" "sql_server_bad" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "c1219abf-9bf8-4e74-994b-7a16f98b8a31"
  }
}

resource "azurerm_sql_active_directory_administrator" "example" {
  server_name         = azurerm_sql_server.sql_server_good.name
  resource_group_name = azurerm_resource_group.example.name
  login               = "sqladmin"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}
