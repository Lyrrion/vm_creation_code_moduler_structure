tenant_id       = "b88318e4-51e5-4953-b3e1-6f8df1d990ce" # Can also be set via `ARM_TENANT_ID` environment variable.
subscription_id = "c3408e32-e222-42c2-8c6d-9edc55d79da8"

resource_group = {
  rg1 = {
    name     = "app-resource-group-1"
    location = "australia east"
  }

}

storage_account = {
  "stg1" = {
    name                     = "app01storageaccount121"
    resource_group_name      = "app-resource-group-1"
    location                 = "australia east"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

virtual_network = {
  "vnet1" = {
    name                = "app-vnet-1"
    address_space       = ["10.0.0.0/16"]
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
  }
}

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

  "AzureBastionSubnet" = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    address_prefixes     = ["10.0.0.192/26"]
  }

  "ApplicationGatway" = {
    name                 = "ApplicationGatway"
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    address_prefixes     = ["10.0.0.0/26"]
  }


}


network_security_group = {
  "nsg1" = {
    name                = "NSGTestSecurityGroup1"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
  }

  "nsg2" = {
    name                = "NSGTestSecurityGroup2"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
  }

  "nsg3" = {
    name                = "NSGTestSecurityGroup3"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
  }

  "nsg4" = {
    name                = "NSGTestSecurityGroup4"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
  }

}



public_ip = {
  "pip1" = {
    name                = "bastionpip"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}




network_interface = {

  interface_1 = {
    name                = "frontend-nic"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    subnet_name         = "frontend-subnet-1"
    vnet_name           = "app-vnet-1"

  }
  interface_2 = {
    name                = "backend-nic"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    subnet_name         = "backend-subnet-1"
    vnet_name           = "app-vnet-1"


  }
  interface_3 = {
    name                = "frontend-nic1"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    subnet_name         = "frontend-subnet-1"
    vnet_name           = "app-vnet-1"
  }
  interface_4 = {
    name                = "backend-nic1"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    subnet_name         = "backend-subnet-1"
    vnet_name           = "app-vnet-1"
  }
}

network_interface_security_group_association = {
  frontend = {
    nic_name = "frontend-nic"
    nsg_name = "NSGTestSecurityGroup1"
    rg_name  = "app-resource-group-1"
  }

  backend = {
    nic_name = "backend-nic"
    nsg_name = "NSGTestSecurityGroup2"
    rg_name  = "app-resource-group-1"
  }

  frontend1 = {
    nic_name = "frontend-nic1"
    nsg_name = "NSGTestSecurityGroup3"
    rg_name  = "app-resource-group-1"
  }
  backend1 = {
    nic_name = "backend-nic1"
    nsg_name = "NSGTestSecurityGroup4"
    rg_name  = "app-resource-group-1"
  }

}


bastion_host = {
  "bastion_1" = {
    name                 = "bastion_1"
    location             = "australia east"
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    subnet_name          = "AzureBastionSubnet"
    public_ip_name       = "bastionpip"
  }
}

key_vault = {
  "myvm" = {
    name                = "app-sujitvault-07"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
  }
}

linux_virtual_machine = {
  "vm1" = {
    name                = "app-vm-1"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    size                = "Standard_B1s"
    nic_key             = "interface_1"
  }

  "vm2" = {
    name                = "app-vm-2"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    size                = "Standard_B1s"
    nic_key             = "interface_2"

  }

  "vm3" = {
    name                = "app-vm-3"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    size                = "Standard_B1s"
    nic_key             = "interface_3"

  }

  "vm4" = {
    name                = "app-vm-4"
    location            = "australia east"
    resource_group_name = "app-resource-group-1"
    size                = "Standard_B1s"
    nic_key             = "interface_4"

  }


}

