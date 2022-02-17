data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West US"
  tags = {
    yor_trace = "438d802c-c3fc-4ba1-bd4d-248f9b097052"
  }
}


#fail
resource "azurerm_cognitive_account" "cognitive_account_bad" {
  name                = "example-account"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Face"
  sku_name            = "S0"
  tags = {
    yor_trace = "5e74039e-6e13-434c-ba79-969a3cc272cd"
  }
}


#pass
resource "azurerm_cognitive_account" "cognitive_account_good" {
  name                          = "example-account"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  kind                          = "Face"
  sku_name                      = "E0"
  public_network_access_enabled = false
  tags = {
    yor_trace = "ae9f1138-09e3-4c8d-9c7b-b78115079d13"
  }
}

resource "azurerm_key_vault" "good_vault" {
  name                = "example-vault"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  tags = {
    yor_trace = "19c04c54-ca54-4cef-ade4-557791fb9b6a"
  }
}

resource "azurerm_key_vault_key" "good_key" {
  name         = "example-key"
  key_vault_id = azurerm_key_vault.good_vault.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  tags = {
    yor_trace = "0299743c-fc73-4728-8788-5839de5b5322"
  }
}

resource "azurerm_cognitive_account_customer_managed_key" "good_cmk" {
  cognitive_account_id = azurerm_cognitive_account.cognitive_account_good.id
  key_vault_key_id     = azurerm_key_vault_key.good_key.id
}