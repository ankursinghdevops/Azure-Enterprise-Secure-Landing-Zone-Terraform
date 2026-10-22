resource "azurerm_network_interface" "nics" {
    for_each = var.x
    name = each.value.nic_name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = "dev_ip"
    subnet_id = data.azurerm_subnet.subnets[each.key].id
    private_ip_address_allocation = "Dynamic"

  }
}
resource "azurerm_linux_virtual_machine" "linusvms" {
  for_each = var.x
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nics[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}