resource "azurerm_resource_group" "blobExample_ok" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "5087d083-1ef3-46cf-927d-aded2f7b0c5b"
  }
}

resource "azurerm_log_analytics_workspace" "blobExample_ok" {
  name                = "exampleworkspace"
  location            = azurerm_resource_group.blobExample_ok.location
  resource_group_name = azurerm_resource_group.blobExample_ok.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    yor_trace = "e3eb383f-385d-470f-a089-79049e716853"
  }
}

resource "azurerm_storage_account" "blobExample_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_ok.name
  location                 = azurerm_resource_group.blobExample_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "8b93c25d-a3de-415a-a4ca-b000093e9059"
  }
}

resource "azurerm_log_analytics_storage_insights" "blobExample_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_ok.id

  storage_account_id  = azurerm_storage_account.blobExample_ok.id
  storage_account_key = azurerm_storage_account.blobExample_ok.primary_access_key
  table_names         = ["myexampletable_ok"]
  tags = {
    yor_trace = "10acab0a-8e8f-4d04-af54-7ab4a1037feb"
  }
}

resource "azurerm_storage_table" "blobExample_ok" {
  name                   = "myexampletable_ok"
  storage_account_name   = azurerm_storage_account.blobExample_ok.name
  storage_container_name = azurerm_storage_container.blobExample_ok.name
}


resource "azurerm_storage_account" "blobExample_not_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_not_ok.name
  location                 = azurerm_resource_group.blobExample_not_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "ba7c6468-5105-4b49-8792-dea76e4dcb4d"
  }
}

resource "azurerm_log_analytics_storage_insights" "blobExample_not_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_not_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_not_ok.id

  storage_account_id  = azurerm_storage_account.blobExample_not_ok.id
  storage_account_key = azurerm_storage_account.blobExample_not_ok.primary_access_key
  tags = {
    yor_trace = "ea582ed8-22d2-4c3f-8845-30e57dbe1e78"
  }
}

resource "azurerm_storage_table" "blobExample_not_ok" {
  name                   = "myexampletable_not_ok"
  storage_account_name   = azurerm_storage_account.blobExample_not_ok.name
  storage_container_name = azurerm_storage_container.blobExample_not_ok.name
}

