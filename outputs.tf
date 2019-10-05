output "recovery_services_vault_id" {
  description = "Recovery Services Vault id"
  value       = "${azurerm_recovery_services_vault.vault.id}"
}

output "recovery_services_vault_name" {
  description = "Recovery Services Vault Name"
  value       = "${azurerm_recovery_services_vault.vault.name}"
}

output "resource_group_name" {
  description = "Resource Group Name"
  value       = "${azurerm_recovery_services_vault.vault.resource_group_name}"
}

output "recovery_services_protection_policy_id" {
  description = "Recovery Services Protection Policy id"
  value       = "${azurerm_recovery_services_protection_policy_vm.vault_policy.id}"
}

output "recovery_services_protection_policy_name" {
  description = "Recovery Services  Protection Policy Name"
  value       = "${azurerm_recovery_services_protection_policy_vm.vault_policy.name}"
}

output "recovery_services_protected_vm_id" {
  description = "Recovery Services Protected VM id"
  value       = "${azurerm_recovery_services_protected_vm.protected_vm.source_vm_id}"
}

