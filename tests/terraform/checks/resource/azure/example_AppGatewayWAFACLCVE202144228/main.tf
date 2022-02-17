# pass

resource "azurerm_web_application_firewall_policy" "owasp_3_1_default" {
  location            = "germanywestcentral"
  name                = "example"
  resource_group_name = "example"

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
    }
  }

  policy_settings {}
  tags = {
    yor_trace = "8ce630f3-0265-4aa4-8bc3-946db5febc94"
  }
}

resource "azurerm_web_application_firewall_policy" "owasp_3_2_default" {
  location            = "germanywestcentral"
  name                = "example"
  resource_group_name = "example"

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  policy_settings {}
  tags = {
    yor_trace = "e389aed8-cb74-42a4-ab62-627030f34e93"
  }
}

resource "azurerm_web_application_firewall_policy" "version_3_1_default" {
  location            = "germanywestcentral"
  name                = "example"
  resource_group_name = "example"

  managed_rules {
    managed_rule_set {
      version = "3.2"
    }
  }

  policy_settings {}
  tags = {
    yor_trace = "3c93597c-a9b8-4695-9e56-ca1dc95055d7"
  }
}

resource "azurerm_web_application_firewall_policy" "owasp_3_1_disabled_different" {
  location            = "germanywestcentral"
  name                = "example"
  resource_group_name = "example"

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"

      rule_group_override {
        rule_group_name = "REQUEST-944-APPLICATION-ATTACK-JAVA"
        disabled_rules = [
          "944200",
          "944210"
        ]
      }
    }
  }

  policy_settings {}
  tags = {
    yor_trace = "daae1769-32bd-40b9-beb0-e4f55121e817"
  }
}

# fail

resource "azurerm_web_application_firewall_policy" "owasp_3_0" {
  location            = "germanywestcentral"
  name                = "example"
  resource_group_name = "example"

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.0"
    }
  }

  policy_settings {}
  tags = {
    yor_trace = "117e2bb7-e058-4f5c-8b27-520bee78a459"
  }
}

resource "azurerm_web_application_firewall_policy" "owasp_3_1_disabled" {
  location            = "germanywestcentral"
  name                = "example"
  resource_group_name = "example"

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"

      rule_group_override {
        rule_group_name = "REQUEST-944-APPLICATION-ATTACK-JAVA"
        disabled_rules = [
          "944200",
          "944240"
        ]
      }
    }
  }

  policy_settings {}
  tags = {
    yor_trace = "742300b0-5bde-452c-8594-2de654206505"
  }
}
