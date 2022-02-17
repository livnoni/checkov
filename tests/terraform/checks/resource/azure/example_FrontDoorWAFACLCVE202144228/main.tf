# pass

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_default" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"
  }
  tags = {
    yor_trace = "cde77902-56d7-416d-b2b9-e42f97d842b4"
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_0_default" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }
  tags = {
    yor_trace = "6e32afac-dd7a-495b-9c3b-fbdcd2f6532d"
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_enabled_block" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Block"
        enabled = true
        rule_id = "944240"
      }
    }
  }
  tags = {
    yor_trace = "6ebd054c-89a4-4a99-b166-dd3519b2dfd0"
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_enabled_redirect" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Redirect"
        enabled = true
        rule_id = "944240"
      }
    }
  }
  tags = {
    yor_trace = "aa8f0688-7c3b-44e8-96e1-ba1b5a48234e"
  }
}

# fail

resource "azurerm_frontdoor_firewall_policy" "default" {
  name                = "example"
  resource_group_name = "example"
  tags = {
    yor_trace = "40de3f31-ac6d-4c1a-bd22-0ce0e66de023"
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_disabled" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Block"
        enabled = false
        rule_id = "944240"
      }
    }
  }
  tags = {
    yor_trace = "4c73df86-be4d-4188-9cce-45a2a34d61cd"
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_disabled_default" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Block"
        rule_id = "944240"
      }
    }
  }
  tags = {
    yor_trace = "dbe6fa58-cd1f-4f9b-a1ef-72dea7c0fbcd"
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_enabled_allow" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Allow"
        enabled = true
        rule_id = "944240"
      }
    }
  }
  tags = {
    yor_trace = "45abdace-2c52-41ba-86a9-343ce5448dfd"
  }
}
