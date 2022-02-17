## SHOULD PASS: Premium tier SKU, explicitly disabled
resource "azurerm_container_registry" "ckv_unittest_pass_1" {
  name                   = "containerRegistry1"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  sku                    = "Premium"
  anonymous_pull_enabled = false
  tags = {
    yor_trace = "7b568675-9974-4bf0-aec5-49bcb485deae"
  }
}

## SHOULD PASS: Premium tier SKU, disabled by default
resource "azurerm_container_registry" "ckv_unittest_pass_2" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  tags = {
    yor_trace = "03cc0338-ab07-439f-ae04-799f6e3e2640"
  }
}

## SHOULD PASS: Standard tier SKU, disabled by default
resource "azurerm_container_registry" "ckv_unittest_pass_3" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  tags = {
    yor_trace = "3c7c4875-e1f6-4096-acf0-614e4bd78fa4"
  }
}

## SHOULD PASS: Basic tier should be ignored, anonymous_pull_enabled not supported
resource "azurerm_container_registry" "ckv_unittest_pass_4" {
  name                   = "containerRegistry1"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  sku                    = "Basic"
  anonymous_pull_enabled = true
  tags = {
    yor_trace = "672a9189-8e3b-4a28-92d3-88731b199e7b"
  }
}

## SHOULD PASS: No explicit tier defined scenario should be ignored, as of azurerm v2.96.0 sku defaults to Classic which is unsupported
resource "azurerm_container_registry" "ckv_unittest_pass_5" {
  name                   = "containerRegistry1"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  anonymous_pull_enabled = true
  tags = {
    yor_trace = "16a7d574-da7f-43cf-b868-845c770472bb"
  }
}

## SHOULD FAIL: Premium tier, explicitly enabled
resource "azurerm_container_registry" "ckv_unittest_fail_1" {
  name                   = "containerRegistry1"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  sku                    = "Premium"
  anonymous_pull_enabled = true
  tags = {
    yor_trace = "97071d85-fc71-4d7d-ac23-5dd57a86555f"
  }
}

## SHOULD FAIL: Standard tier, explicitly enabled
resource "azurerm_container_registry" "ckv_unittest_fail_2" {
  name                   = "containerRegistry1"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  sku                    = "Standard"
  anonymous_pull_enabled = true
  tags = {
    yor_trace = "ded83508-daa0-4312-b86a-34a3b4b6417f"
  }
}
