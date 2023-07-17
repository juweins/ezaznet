resource "azurerm_virtual_network" "hub-vnet" {
  name                = "hub-vnet"
  address_space       = [var.address_space[0]]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_virtual_network" "spoke-1-vnet" {
  name                = "spoke-2-vnet"
  address_space       = [var.address_space[1]]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_virtual_network" "spoke-2-vnet" {
  name                = "spoke-2-vnet"
  address_space       = [var.address_space[2]]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "hub-subnet-bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.hub-vnet.address_space[0], 8, 0)]
}

resource "azurerm_subnet" "hub-subnet-gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.hub-vnet.address_space[0], 8, 1)]
}

resource "azurerm_subnet" "hub-subnet-firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.hub-vnet.address_space[0], 8, 2)]
}