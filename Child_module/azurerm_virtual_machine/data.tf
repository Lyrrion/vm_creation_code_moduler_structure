# data "azurerm_key_vault_secret" "vm_username" {
#   name         = "username"
#   key_vault_id = data.azurerm_key_vault.keyvault.id
# }

# data "azurerm_key_vault_secret" "vm_password" {
#   name         = "vm-password"
#   key_vault_id = data.azurerm_key_vault.keyvault.id
# }

data "azurerm_network_interface" "interfaces" {
  for_each = var.network_interface
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}


# data "azurerm_key_vault" "keyvault" {
#   name                = "mykeyvault"
#   resource_group_name = "app-resource-group-1"
# }


