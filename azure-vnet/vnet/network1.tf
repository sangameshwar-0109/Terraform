resource "azurerm_resource_group" "primary_network" {
  name     = "vntier"
  location = "centralindia"
  tags = {
    name        = "ntier"
    Environment = "dev"
    createdBy   = "terraform"
  }
}

resource "azurerm_virtual_network" "primary" {
  name                = "vntier"
  resource_group_name = azurerm_resource_group.primary_network.name
  address_space       = ["10.100.0.0/16"]
  location            = "centralindia"
  depends_on          = [azurerm_resource_group.primary_network]

}

resource "azurerm_subnet" "web" {
  name                 = "web"
  resource_group_name  = azurerm_resource_group.primary_network.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.100.0.0/24"]
  depends_on           = [azurerm_virtual_network.primary]
}

resource "azurerm_subnet" "business" {
  name                 = "business"
  resource_group_name  = azurerm_resource_group.primary_network.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.100.1.0/24"]
  depends_on           = [azurerm_virtual_network.primary]
}

resource "azurerm_subnet" "data" {
  name                 = "data"
  resource_group_name  = azurerm_resource_group.primary_network.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.100.2.0/24"]
  depends_on           = [azurerm_virtual_network.primary]
}





