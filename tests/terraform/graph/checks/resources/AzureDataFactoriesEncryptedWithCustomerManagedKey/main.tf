resource "azurerm_data_factory" "data_factory_good" {
  name                = "example"
  location            = "location"
  resource_group_name = "group"
  tags = {
    yor_trace = "34023649-0b87-4362-9fc5-f230767a37fa"
  }
}

resource "azurerm_data_factory" "data_factory_bad" {
  name                = "example"
  location            = "location"
  resource_group_name = "group"
  tags = {
    yor_trace = "e4f6ccfd-d78d-4280-a8ad-06e0a2dedbf3"
  }
}

resource "azurerm_data_factory_linked_service_key_vault" "factory_good" {
  name                = "example"
  resource_group_name = "example"
  data_factory_name   = azurerm_data_factory.data_factory_good.name
  key_vault_id        = "123456"
}