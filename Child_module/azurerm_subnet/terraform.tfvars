subnet = {
  "subnet1" = {
    name                 = "frontend-subnet-1"
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    address_prefixes     = ["10.0.0.64/26"]
  }

  "subnet2" = {
    name                 = "backend-subnet-1"
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    address_prefixes     = ["10.0.0.128/26"]
  }

  AzureBastionSubnet = {
    name                 = AzureBastionSubnet
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    address_prefixes     = ["10.0.0.192/26"]    
}

}