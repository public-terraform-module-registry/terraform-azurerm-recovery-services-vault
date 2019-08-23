output "id" {
  description = "Recovery Services Vault id"
  value       = "${azurerm_recovery_services_vault,vault.id}"
}

output "name" {
  description = "Recovery Services Vault  Name"
  value       = "${azurerm_recovery_services_vault,vault.name}"
}

output "resource_group_name" {
  description = "Resource Group Name"
  value       = "${azurerm_recovery_services_vault,vault.resource_group_name}"
}
