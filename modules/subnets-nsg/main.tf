# Subnets for gateway
resource "azurerm_subnet" "gateway_subnet" {
  name = var.gateway_subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = var.gateway_subnet_address
}

# Subnets for DMZ
resource "azurerm_subnet" "dmz_subnet" {
  name = var.dmz_subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = var.dmz_subnet_address
}

# Subnets for AD
resource "azurerm_subnet" "ad_subnet" {
  name = var.ad_subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = var.ad_subnet_address
}

# Subnets for Desktop
resource "azurerm_subnet" "desktop_subnet" {
  name = var.desktop_subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = var.desktop_subnet_address
}




# Network Security Group for DMZ
resource "azurerm_network_security_group" "dmz_nsg" {
  name = var.dmz_nsg_name
  location = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowRD"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "CorpNetSaw"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowLDAPS"
    priority                   = 401
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "636"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Network Security Group for AD
resource "azurerm_network_security_group" "ad_nsg" {
  name = var.ad_nsg_name
  location = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowPSRemoting"
    priority                   = 301
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5986"
    source_address_prefix      = "AzureActiveDirectoryDomainServices"
    destination_address_prefix = "*"
  }
}

# Network Security Group for Desktop
resource "azurerm_network_security_group" "desktop_nsg" {
  name = var.desktop_nsg_name
  location = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowRD"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "CorpNetSaw"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowLDAPS"
    priority                   = 401
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "636"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}




# Network Security Group Association

resource "azurerm_subnet_network_security_group_association" "dmz_nsg_association" {
  subnet_id                 = azurerm_subnet.dmz_subnet.id
  network_security_group_id = azurerm_network_security_group.dmz_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "ad_nsg_association" {
  subnet_id                 = azurerm_subnet.ad_subnet.id
  network_security_group_id = azurerm_network_security_group.ad_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "desktop_nsg_association" {
  subnet_id                 = azurerm_subnet.desktop_subnet.id
  network_security_group_id = azurerm_network_security_group.desktop_nsg.id
}