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
