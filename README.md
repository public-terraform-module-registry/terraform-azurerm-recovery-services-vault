# terraform-azurerm-vm-backup
## Deploys a Recovery Service and Protects your provided Virtual Machine

This Terraform module deploys a Recovery Service in Azure and protects upir provided virtual machine (VM) with the following characteristics:

- Ability to take a backup with a provided frequency of `var.frequency`(Default value: Daily) at the time of `var.time` (Default value: 18:00 UTC) and retention period `var.retention_daily_count`

> Note: Probably because of limitation on Azure RM, timezone other than UTC cannot be selected as a parameter.

## Usage

This contains the bare minimum options to be configured for the recovery service to be provisioned.

```hcl
data "azurerm_resource_group" "rg" {
  name = "rg"
}

data "azurerm_virtual_machine" "vm" {
  name                = "vm"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
}

module "vm_backup" {
  source                                   = "github.com/public-terraform-module-registry/terraform-azurerm-vm-backup.git"
  location                                 = "East US"
  resource_group_name                      = "${data.azurerm_resource_group.rg.name}"
  recovery_services_vault_name             = "vmrecoveryservice"
  recovery_services_protection_policy_name = "vmrecoverypolicy"
  source_vm_id                             = "${data.azurerm_virtual_machine.vm.id}"
}
```

## Authors

Originally created by [tomu](https://github.com/nm7-jp)

## License

[MIT](LICENSE)
