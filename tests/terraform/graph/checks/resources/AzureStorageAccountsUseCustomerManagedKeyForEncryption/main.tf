data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                = "examplekv"
  location            = "location"
  resource_group_name = "group"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
  tags = {
    yor_trace = "e8bb1dc0-0775-42b4-9c72-a176b86226e3"
  }
}

resource "azurerm_key_vault_key" "example" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  tags = {
    yor_trace = "ce2f85e1-52b8-4d02-8812-f555b384b980"
  }
}


resource "azurerm_storage_account" "storage_account_good_1" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "72392aab-9d33-4344-8112-bdfa2ac6f2fd"
  }
}

resource "azurerm_storage_account" "storage_account_bad_1" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "d7d4fdae-655e-43f9-ae5d-54294c14a9a8"
  }
}

resource "azurerm_storage_account" "storage_account_bad_2" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "eb656277-b3c4-41fb-8783-351079ad74c4"
  }
}

resource "azurerm_storage_account_customer_managed_key" "managed_key_good" {
  storage_account_id = azurerm_storage_account.storage_account_good_1.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
  key_version        = "1"
}


resource "azurerm_storage_account_customer_managed_key" "managed_key_bad_1" {
  storage_account_id = azurerm_storage_account.storage_account_bad_1.id
  key_vault_id       = ""
  key_name           = azurerm_key_vault_key.example.name
  key_version        = "1"
}
