resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.linux_virtual_machine
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size
  disable_password_authentication = false
  

  network_interface_ids = [
    var.nic_ids[each.value.nic_key]
  ]

  admin_username = "dudu1"
  admin_password = "Bubu12345##"

 os_disk {
  name                 = "${each.value.name}-osdisk"
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"
}


 # Encode custom_data in base64
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "<h1>Hello from $(hostname) - Installed via Custom Data</h1>" > /var/www/html/index.html
  EOF
  )
  


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}