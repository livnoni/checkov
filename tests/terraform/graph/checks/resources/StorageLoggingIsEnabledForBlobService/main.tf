resource "azurerm_resource_group" "resource_group_ok" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "855f4cdd-0d00-4403-a875-3e6f79c75cd9"
  }
}

resource "azurerm_log_analytics_workspace" "analytics_workspace_ok" {
  name                = "exampleworkspace"
  location            = azurerm_resource_group.resource_group_ok.location
  resource_group_name = azurerm_resource_group.resource_group_ok.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    yor_trace = "d3e08884-cd89-4f82-982c-e018b29cf62e"
  }
}

resource "azurerm_storage_account" "storage_account_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.resource_group_ok.name
  location                 = azurerm_resource_group.resource_group_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "9929bec8-aaa1-43d1-ae23-777a5e91e382"
  }
}

resource "azurerm_log_analytics_storage_insights" "analytics_storage_insights_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.resource_group_ok.name
  workspace_id        = azurerm_log_analytics_workspace.analytics_workspace_ok.id

  storage_account_id   = azurerm_storage_account.storage_account_ok.id
  storage_account_key  = azurerm_storage_account.storage_account_ok.primary_access_key
  blob_container_names = ["blobExample_ok"]
  tags = {
    yor_trace = "2baf3907-3cec-4869-b756-d2749ab1213c"
  }
}

resource "azurerm_storage_container" "storage_container_ok" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account_ok.name
  storage_container_name = azurerm_storage_container.storage_container_ok.name
  container_access_type  = "blob"
}


resource "azurerm_storage_account" "storage_account_not_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_not_ok.name
  location                 = azurerm_resource_group.blobExample_not_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "e128d780-f314-42e8-97ee-aa9ead468000"
  }
}

resource "azurerm_log_analytics_storage_insights" "storage_insights_not_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_not_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_not_ok.id

  storage_account_id  = azurerm_storage_account.storage_account_not_ok.id
  storage_account_key = azurerm_storage_account.storage_account_not_ok.primary_access_key
  tags = {
    yor_trace = "02fd2acc-2769-4133-8824-762eaf551965"
  }
}

resource "azurerm_storage_container" "storage_container_not_ok" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account_not_ok.name
  storage_container_name = azurerm_storage_container.storage_container_not_ok.name
  container_access_type  = "blob"
}


