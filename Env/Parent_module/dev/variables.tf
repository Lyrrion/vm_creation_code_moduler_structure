variable "subscription_id" {
  description = "The subscription ID for the Azure subscription"
  type        = string
}
variable "tenant_id" {
  description = "The tenant ID for the Azure subscription"
  type        = string
}

variable "resource_group" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage_account" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "virtual_network" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))

}

variable "subnet" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}

variable "network_security_group" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "network_interface" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
  }))
}

variable "network_interface_security_group_association" {
  type = map(object({
    nic_name = string
    nsg_name = string
    rg_name  = string
  }))
}

variable "public_ip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))

}

variable "bastion_host" {
  description = "A map of bastion host configurations."
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    public_ip_name       = string
  }))

}

variable "key_vault" {
  description = "A map of key vault configurations."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))

}

variable "linux_virtual_machine" {
  description = "A map of Linux Virtual Machine configurations."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    nic_key             = string
  }))

}


