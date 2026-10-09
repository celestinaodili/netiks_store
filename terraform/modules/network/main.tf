resource "azurerm_virtual_network" "netiks_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "netiks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.netiks_vnet.name
  address_prefixes     = var.subnet_address_prefixes

  default_outbound_access_enabled = false
}

resource "azurerm_network_security_group" "netiks_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_network_security_rule" "ssh" {
  name                        = "SSH"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefixes     = ["102.88.110.3/32", "20.232.141.93/32"]
  destination_address_prefix  = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.netiks_nsg.name
}

resource "azurerm_network_security_rule" "http" {
  name                       = "HTTP"
  priority                   = 310
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "0.0.0.0/0"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.netiks_nsg.name
}

resource "azurerm_network_security_rule" "https" {
  name                       = "HTTPS"
  priority                   = 320
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefix      = "0.0.0.0/0"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.netiks_nsg.name
}

resource "azurerm_network_security_rule" "staging_8080" {
  name                       = "Allow-Staging-8080"
  priority                   = 330
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "8080"
  source_address_prefix      = "0.0.0.0/0"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.netiks_nsg.name
}


resource "azurerm_public_ip" "netiks_public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method       = "Static"
  sku                     = "Standard"
  sku_tier                = "Regional"
  ip_version              = "IPv4"
  idle_timeout_in_minutes = 4

  ip_tags = {
    FirstPartyUsage = "/Unprivileged"
  }
}

resource "azurerm_network_interface" "netiks_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.netiks_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.netiks_public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "netiks_nic_nsg" {
  network_interface_id      = azurerm_network_interface.netiks_nic.id
  network_security_group_id = azurerm_network_security_group.netiks_nsg.id
}
