# pass

resource "azurerm_data_factory" "github" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name

  github_configuration {
    account_name    = "bridgecrewio"
    branch_name     = "master"
    git_url         = "https://github.com"
    repository_name = "checkov"
    root_folder     = "/"
  }
  tags = {
    yor_trace = "2388ced9-7945-42ec-8645-f8c37fdb9087"
  }
}

resource "azurerm_data_factory" "vsts" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name

  vsts_configuration {
    account_name    = "bridgecrewio"
    branch_name     = "master"
    project_name    = "chechov"
    repository_name = "checkov"
    root_folder     = "/"
    tenant_id       = "123456789"
  }
  tags = {
    yor_trace = "1761063c-02b7-49ed-99b8-7529f196956e"
  }
}

# fail

resource "azurerm_data_factory" "fail" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    yor_trace = "002f7cec-e249-4844-a2e8-7eab831ac65f"
  }
}
