provider "azurerm" {
  version = ">= 1.1.0"
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "${var.recovery_services_vault_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.sku}"
}
