resource "azurerm_sql_server" "sql_server_good_1" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "7f42b169-915b-4c7e-9340-fcc61ef720c9"
  }
}

resource "azurerm_sql_server" "sql_server_good_2" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "bd7434ed-5297-49e9-9083-a816bacc4370"
  }
}

resource "azurerm_sql_server" "sql_server_bad_1" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "e6110065-5e2c-4773-b656-29a2db2879c9"
  }
}

resource "azurerm_mssql_server_security_alert_policy" "alert_policy_good" {
  resource_group_name = "group"
  server_name         = azurerm_sql_server.sql_server_good_1.name
  state               = "Enabled"
  retention_days      = 20
}

resource "azurerm_mssql_server_security_alert_policy" "alert_policy_bad" {
  resource_group_name = "group"
  server_name         = azurerm_sql_server.sql_server_bad_1.name
  state               = "Disabled"
  retention_days      = 20
}