resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.linux_virtual_machine
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size

  network_interface_ids = [
    var.nic_ids[each.value.nic_key]
  ]

  admin_username = data.azurerm_key_vault_secret.vm_username.value
  admin_password = data.azurerm_key_vault_secret.vm_password.value

 os_disk {
  name                 = "${each.value.name}-osdisk"
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"
}


custom_data = <<-EOF
#!/bin/bash
apt-get update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>Hello from $(hostname) - Installed via Custom Data</h1>" > /var/www/html/index.html
EOF


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}