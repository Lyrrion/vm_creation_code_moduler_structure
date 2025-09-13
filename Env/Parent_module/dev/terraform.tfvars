tenant_id       = "4219d509-5517-451d-8c28-e650b1f915aa" # Can also be set via `ARM_TENANT_ID` environment variable.
subscription_id = "e8e67e49-af5a-4a37-abc9-4599917aee83"

resource_group = {
  rg1 = {
    name     = "app-resource-group-1"
    location = "Japan West"
  }

}

storage_account = {
  "stg1" = {
    name                     = "app01storageaccount"
    resource_group_name      = "app-resource-group-1"
    location                 = "Japan West"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

virtual_network = {
  "vnet1" = {
    name                = "app-vnet-1"
    address_space       = ["10.0.0.0/16"]
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
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

}


network_security_group = {
  "nsg1" = {
    name                = "NSGTestSecurityGroup1"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
  }

  "nsg2" = {
    name                = "NSGTestSecurityGroup2"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
  }

}



public_ip = {
  "pip1" = {
    name                = "bastionpip"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}




network_interface = {

  interface_1 = {
    name                = "frontend-nic"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
    subnet_name         = "frontend-subnet-1"
    vnet_name           = "app-vnet-1"

  }
  interface_2 = {
    name                = "backend-nic"
    location            = "Japan West"
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
}


bastion_host = {
  "bastion_1" = {
    name                 = "bastion_1"
    location             = "Japan West"
    resource_group_name  = "app-resource-group-1"
    virtual_network_name = "app-vnet-1"
    subnet_name          = "AzureBastionSubnet"
    public_ip_name       = "bastionpip"
  }
}

key_vault = {
  "myvm" = {
    name                = "app-sujitvault-01"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
  }
}

linux_virtual_machine = {
  "vm1" = {
    name                = "app-vm-1"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
    size                = "Standard_D2s_v3"
    nic_key             = "interface_1"
  }

  "vm2" = {
    name                = "app-vm-2"
    location            = "Japan West"
    resource_group_name = "app-resource-group-1"
    size                = "Standard_D2s_v3"
    nic_key             = "interface_2"

  }

  
}

