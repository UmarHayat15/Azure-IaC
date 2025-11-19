# VIRTUAL DESKTOP WORKSPACE
resource "azurerm_virtual_desktop_workspace" "worksapce" {
  name = var.workspace_name
  location = var.location
  resource_group_name = var.resource_group_name
  friendly_name = var.workspace_name
}

# Hostpool
resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  location = var.location
  resource_group_name = var.resource_group_name

  name = var.host_pool_name
  friendly_name = var.host_pool_friendly_name
  validate_environment = var.host_pool_validate_environment
  custom_rdp_properties = var.host_pool_custom_rdp_properties
  type = var.host_pool_type
  maximum_sessions_allowed = var.host_pool_maximum_sessions_allowed
  load_balancer_type = var.host_pool_load_balancer_type

  # lifecycle {
  #   prevent_destroy = true
  # }
}

# HOST POOL REGISTRATION
resource "azurerm_virtual_desktop_host_pool_registration_info" "hostpool_registration" {
  hostpool_id = azurerm_virtual_desktop_host_pool.hostpool.id
  expiration_date = var.host_pool_registration_expiration_date
}


# Application Group
resource "azurerm_virtual_desktop_application_group" "dag" {
  resource_group_name = var.resource_group_name
  location = var.location
  host_pool_id = azurerm_virtual_desktop_host_pool.hostpool.id
  type = var.application_group_type

  name = var.application_group_name
  friendly_name = var.application_group_friendly_name
  description = var.application_group_description

  depends_on = [ azurerm_virtual_desktop_host_pool.hostpool, azurerm_virtual_desktop_workspace.worksapce ]
}

# Associate Application Group with Worksapce
resource "azurerm_virtual_desktop_workspace_application_group_association" "ag_ws" {
  workspace_id = azurerm_virtual_desktop_workspace.worksapce.id
  application_group_id = azurerm_virtual_desktop_application_group.dag.id
}


# create Windows Virtual Desktop Application Group Desktop Network Interface
resource "azurerm_network_interface" "nic" {
  count = var.vm_count
  name = "nic-${count.index+1}"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "ipconfig-${count.index+1}"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# create Windows Virtual Desktop Application Group Desktop Application
resource "azurerm_windows_virtual_machine" "desktop_vms" {
  count = var.vm_count
  name = "AVD-desktop-${count.index+1}"
  computer_name = "desktop-${count.index+1}"
  location = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = ["${azurerm_network_interface.nic.*.id[count.index]}"]
  size = var.vm_size
  admin_username = var.vm_admin_password
  admin_password = var.vm_admin_password
  enable_automatic_updates = var.vm_automatic_updates
  timezone = var.timezone
  allow_extension_operations = var.allow_extension_operations

  os_disk {
    caching = var.caching
    storage_account_type = var.storage_account_type
    disk_size_gb = var.disk_size_gb
  }

  source_image_reference {
    publisher = var.publisher
    offer = var.offer
    sku = var.sku
    version = var.image_version
  }
  
  boot_diagnostics {}
  
  depends_on = [ azurerm_network_interface.nic, azurerm_virtual_desktop_application_group.dag ]
  lifecycle {
    replace_triggered_by = [ 
      azurerm_virtual_desktop_host_pool.hostpool.id
     ]
  }
}

# register Windows Virtual Desktop to Host Pool

resource "azurerm_virtual_machine_extension" "avd_extension" {
  count = var.vm_count
  name = "AVD-Extension-${count.index+1}"
  virtual_machine_id = azurerm_windows_virtual_machine.desktop_vms[count.index].id
  publisher = "Microsoft.Powershell"
  type = "DSC"
  type_handler_version = "2.73"
  settings = <<-SETTINGS
    {
      "modulesUrl": "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_08-10-2022.zip",
      "configurationFunction": "Configuration.ps1\\AddSessionHost",
      "properties": {
        "HostPoolName":"${azurerm_virtual_desktop_host_pool.hostpool.name}"
      }
    }
SETTINGS

  # # attach and authenticate file share to windows virtual desktop via a storage account script or Active Directory or Microsodt Entra
  # settings = <<SETTINGS
  # {
  #   "fileUris": ["https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_08-10-2022.zip"],
  #   "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File Configuration.ps1 -HostPoolName ${azurerm_virtual_desktop_host_pool.hostpool.name}",
  #   "protectedSettings": {
  #     "storageAccountName": "${var.storage_account}",
  #     "storageAccountKey": "${var.storage_account.primary_access_key}",
  #     "DriveLetter": "Z"
  #   }
  # }
  # SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {
    "properties": {
      "registrationInfoToken": "${azurerm_virtual_desktop_host_pool_registration_info.hostpool_registration.token}" 
    }
  }
PROTECTED_SETTINGS

  depends_on = [ azurerm_windows_virtual_machine.desktop_vms, azurerm_virtual_desktop_host_pool.hostpool ]  
}