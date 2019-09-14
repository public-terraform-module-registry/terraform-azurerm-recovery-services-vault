provider "azurerm" {
  version = ">= 1.1.0"
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "${var.recovery_services_vault_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.sku}"
}

resource "azurerm_recovery_services_protection_policy_vm" "vault_policy" {
  name                = "${var.recovery_services_protection_policy_name}"
  resource_group_name = "${var.resource_group_name}"
  recovery_vault_name = "${var.recovery_services_vault_name}"

  timezone = "${var.timezone}"

  backup {
    frequency = "${var.frequency}"
    time      = "${var.time}"
  }

  retention_daily {
    count = "${var.retention_daily_count}"
  }

  depends_on = ["azurerm_recovery_services_vault.vault"]
}

resource "azurerm_recovery_services_protected_vm" "protected_vm" {
  resource_group_name = "${var.resource_group_name}"
  recovery_vault_name = "${var.recovery_services_vault_name}"
  source_vm_id        = "${var.source_vm_id}"
  backup_policy_id    = "${azurerm_recovery_services_protection_policy_vm.vault_policy.id}"
  depends_on          = ["azurerm_recovery_services_vault.vault", "azurerm_recovery_services_protection_policy_vm.vault_policy"]
}

resource "azurerm_storage_account" "restore_storage_account" {
  name                     = "${var.restore_storage_account_name}"
  location                 = "${var.location}"
  account_tier             = "${var.restore_storage_account_tier}"
  resource_group_name      = "${var.resource_group_name}"
  account_replication_type = "${var.restore_storage_account_replication_type}"

  network_rules {
    default_action             = "${var.default_action}"
    virtual_network_subnet_ids = ["${var.virtual_network_subnet_ids}"]
  }
}
