variable "recovery_services_vault_name" {
  description = "(Required) Specifies the name of the Recovery Services Vault. Changing this forces a new resource to be created."
}

variable "location" {
  description = "(Required)Region where the resource group will be created"
  default     = "East US"
}

variable "resource_group_name" {
  description = "(Required)The resource group name"
}

variable "sku" {
  description = " (Required) Sets the vault's SKU. Possible values include: Standard, RS0"
  default     = "Standard"
}

variable "tags" {
  description = "(Optional)Map of tags to apply to the recovery service vault"
  type        = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
}

variable "recovery_services_protection_policy_name" {
  description = "(Required) Specifies the name of name of the Recovery Services Vault Policy. Changing this forces a new resource to be created."
}

## [Bug] Cannot select other than UTC
variable "timezone" {
  description = "(Optional) Specifies the timezone. Defaults to UTC"
  default     = "UTC"
}

variable "frequency" {
  description = "(Required) Sets the backup frequency. Must be either Daily orWeekly"
  default     = "Daily"
}

variable "time" {
  description = "(Required) The time of day to perform the backup in 24hour format."
  default     = "18:00"
}

## [Bug] Should choose higher than 6
variable "retention_daily_count" {
  description = "(Required) The number of daily backups to keep. Must be between 1 and 9999"
  default     = 7
}

variable "source_vm_id" {
  description = "(Required) Specifies the ID of the VM to backup. Changing this forces a new resource to be created."
}

variable "restore_storage_account_name" {
  description = "(Required) Specifies the human consumable label for this resource."
  default     = ""
}

variable "restore_storage_account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS*, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable "restore_storage_account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard* and Premium. Changing this forces a new resource to be created"
  default     = "Standard"
}
