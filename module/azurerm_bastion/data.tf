data "azurerm_public_ip" "pubipnames" {
    for_each = var.x
  name                = each.value.pubip_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "subnets" {
    for_each = var.x
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
    name = each.value.subnet_name
}