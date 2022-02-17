data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "d3f86598-7ea9-4a07-baff-849a89c4796e"
  }
}

resource "azurerm_key_vault" "example" {
  name                = "examplekv"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
  tags = {
    yor_trace = "8f874159-eea6-4d07-9fda-13e4173cf5b7"
  }
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["get", "create", "delete", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_key" "example" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

  depends_on = [
    azurerm_key_vault_access_policy.client
  ]
  tags = {
    yor_trace = "a5893740-aa87-4528-898a-e83a73dbe1e7"
  }
}


resource "azurerm_storage_account" "ok_storage_account" {
  name                     = "examplestor"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "a9bcddad-922a-4882-9e0f-0669dadbdeb5"
  }
}

resource "azurerm_storage_account" "not_ok_storage_account" {
  name                     = "examplestor"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "5b18766b-2a34-4310-9d96-b03297f24fe5"
  }
}

resource "azurerm_storage_account_customer_managed_key" "ok_cmk" {
  storage_account_id = azurerm_storage_account.ok_storage_account.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
}