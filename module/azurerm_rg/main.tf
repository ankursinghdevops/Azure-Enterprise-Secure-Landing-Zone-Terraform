resource "azurerm_resource_group" "rgs" {
    for_each = var.x
    name = each.value.resource_group_name
    location = each.value.location
  
}