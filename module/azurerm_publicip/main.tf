resource "azurerm_public_ip" "pubips" {
    for_each = var.x
  name                = each.value.pubip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}