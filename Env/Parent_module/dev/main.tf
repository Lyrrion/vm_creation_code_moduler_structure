module "app_rg" {
  source         = "../../../Child_module/azurerm_resource_group"
  resource_group = var.resource_group
}

module "stg" {
  source          = "../../../Child_module/azurerm_storage_account"
  storage_account = var.storage_account
  depends_on      = [module.app_rg]
}

module "vnet" {
  source          = "../../../Child_module/azurerm_virtual_network"
  virtual_network = var.virtual_network
  depends_on      = [module.app_rg]
}

module "subnet" {
  source     = "../../../Child_module/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [module.vnet]
}

module "nsg" {
  source                 = "../../../Child_module/azurerm_Network_security_group"
  network_security_group = var.network_security_group
  depends_on             = [module.subnet]
}

module "nic" {
  source            = "../../../Child_module/azurerm_network_interface_card"
  network_interface = var.network_interface
  depends_on        = [module.nsg]

}

module "nsg_association" {
  source                                       = "../../../Child_module/azurerm_NSG_accociation"
  network_interface_security_group_association = var.network_interface_security_group_association
  depends_on                                   = [module.nic, module.nsg, module.subnet]

}

module "public_ip" {
  source     = "../../../Child_module/azurerm_public_ip"
  public_ip  = var.public_ip
  depends_on = [module.app_rg, module.vnet, module.subnet]

}

module "bastion_host" {
  source       = "../../../Child_module/azurerm_bastion_host"
  bastion_host = var.bastion_host
  depends_on   = [module.app_rg, module.vnet, module.subnet, module.public_ip]
}

module "key_vault" {
  source     = "../../../Child_module/azurerm_key_vault"
  key_vault  = var.key_vault
  depends_on = [module.app_rg]
}

# # # module "key_secret" {
# # #   source     = "../../../Child_module/azurerm_key_secret"
# # #   depends_on = [module.key_vault]
# # # }


module "virtual_machine" {
  source                = "../../../Child_module/azurerm_virtual_machine"
  linux_virtual_machine = var.linux_virtual_machine
  network_interface     = var.network_interface
  nic_ids               = module.nic.nic_ids
  depends_on            = [module.nic, module.nsg_association, module.bastion_host, module.key_vault, module.app_rg, module.vnet, module.subnet]
}


