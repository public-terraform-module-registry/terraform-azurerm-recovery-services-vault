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
