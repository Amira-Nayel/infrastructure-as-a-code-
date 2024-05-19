resource "azurerm_resource_group" "moodle" {
  name     = "moodle"
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  name                = "moodlenetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.moodle.location
  resource_group_name = azurerm_resource_group.moodle.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.moodle.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "moodleip" {
  name                = "moodleip"
  location            = azurerm_resource_group.moodle.location
  resource_group_name = azurerm_resource_group.moodle.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "main" {
  name                = "moodlenic"
  location            = azurerm_resource_group.moodle.location
  resource_group_name = azurerm_resource_group.moodle.name

  ip_configuration {
    name                          = "moodleip"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.5"
    public_ip_address_id          = azurerm_public_ip.moodleip.id
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "moodlevm"
  location              = azurerm_resource_group.moodle.location
  resource_group_name   = azurerm_resource_group.moodle.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "moodlesever"
    admin_username = "it-admin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
output "public_ip_address" {
  value = azurerm_public_ip.moodleip.ip_address
}

