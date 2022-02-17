# pass

resource "azurerm_storage_account" "pass" {
  name                     = "storageaccountname"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "fd69b617-2926-4a43-8f1d-075c488e2df4"
  }
}

resource "azurerm_storage_account" "pass_number" {
  name                     = 1234567890
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "b12fd3e3-8156-4c71-9a65-a2a91df7d77b"
  }
}

# fail

resource "azurerm_storage_account" "camel_case" {
  name                     = "thisIsWrong"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "78b5b23f-4e6d-4695-a2b5-e80c474de28d"
  }
}

resource "azurerm_storage_account" "kebab_case" {
  name                     = "this-is-wrong"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "adec102b-0849-47c8-955f-dd0d240bcae3"
  }
}

resource "azurerm_storage_account" "too_long" {
  name                     = "thisiswayyyyyytoooloooong"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "1921f78c-9e04-49f8-ba89-e53481d59def"
  }
}

# unknown

resource "azurerm_storage_account" "local" {
  name                     = "${local.prefix}example"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "b0070c7c-d4a6-40bd-b810-352337d5805a"
  }
}

resource "azurerm_storage_account" "module" {
  name                     = "${module.something.prefix}example"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "efc27357-df67-414d-948f-77dffc179dc3"
  }
}

resource "azurerm_storage_account" "var" {
  name                     = "${var.prefix}example"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "c1d7e455-e271-44b8-bb40-c7b0f24afe1e"
  }
}
