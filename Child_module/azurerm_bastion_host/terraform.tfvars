bastion_host = {
  "bastion_1" = {
    name                = "bastion_1"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    subnet_name           = "AzureBastionSubnet"
    public_ip_name        = "bastionpip"
  }
}