# VIRTUAL DESKTOP WORKSPACE NAME
variable "workspace_name" {
  description = "The name of the Azure Virtual Desktop workspace."
  type = string
  default = "AVDWorkspace"
}

# HOST POOL NAME
variable "host_pool_name" {
  description = "The name of the Azure Virtual Desktop host pool."
  type = string
  default = "AVDHostPool"
}

# HOST POOL FRIENDLY NAME
variable "host_pool_friendly_name" {
  description = "The friendly name of the Azure Virtual Desktop host pool."
  type = string
  default = "AVD Host Pool"
}

# HOST POOL VALIDATE ENVIRONMENT
variable "host_pool_validate_environment" {
  description = "The validate environment of the Azure Virtual Desktop host pool."
  type = bool
  default = true
}
# HOST POOL CUSTOM RDP PROPERTIES
variable "host_pool_custom_rdp_properties" {
  description = "The custom RDP properties of the Azure Virtual Desktop host pool."
  type = string
  default = "audiocapturemode:i:1;audiomode:i:0;targetisaadjoined:i:1;"
}

# HOST POOL TYPE
variable "host_pool_type" {
  description = "The type of the Azure Virtual Desktop host pool."
  type = string
  default = "Pooled"
}

# HOST POOL MAXIMUM SESSIONS ALLOWED
variable "host_pool_maximum_sessions_allowed" {
  description = "The maximum sessions allowed of the Azure Virtual Desktop host pool."
  type = number
  default = 3
}

# HOST POOL LOAD BALANCER TYPE
variable "host_pool_load_balancer_type" {
  description = "The load balancer type of the Azure Virtual Desktop host pool."
  type = string
  default = "DepthFirst"
}

# HOST POOL REGISTRATION EXPIRATION DATE
variable "host_pool_registration_expiration_date" {
  description = "The expiration date of the Azure Virtual Desktop host pool registration."
  type = string
  default = "2024-12-08T12:00:00Z"
}

# APPLICATION GROUP TYPE
variable "application_group_type" {
  description = "The type of the Azure Virtual Desktop application group."
  type = string
  default = "Desktop"
}

# APPLICATION GROUP NAME
variable "application_group_name" {
  description = "The name of the Azure Virtual Desktop application group."
  type = string
  default = "AVDAppGroup"
}

# APPLICATION GROUP FRIENDLY NAME
variable "application_group_friendly_name" {
  description = "The friendly name of the Azure Virtual Desktop application group."
  type = string
  default = "AVD Application Group"
}

# APPLICATION GROUP DESCRIPTION
variable "application_group_description" {
  description = "The description of the Azure Virtual Desktop application group."
  type = string
  default = "AVD Application Group Description"
}


# RESOURCE GROUP NAME
variable "resource_group_name" {
  description = "The Resource Group Name"
  type = string
}

# LOCATION
variable "location" {
  description = "The Azure Region"
  type = string
}



# Desktop subnet ID
variable "subnet_id" {
  description = "The subnet ID for the Azure Virtual Desktop."
  type = string
}

# VM COUNT
variable "vm_count" {
  description = "The number of VMs to create in the host pool."
  type = number
  default = 2
}

# VM SIZE
variable "vm_size" {
  description = "The size of the VMs to create in the host pool."
  type = string
  default = "Standard_G1"
}

# VM automatic updates
variable "vm_automatic_updates" {
  description = "Enable automatic updates for the VMs."
  type = bool
  default = true
}

# VM admin username
variable "vm_admin_username" {
  description = "The admin username for the VMs."
  type = string
  default = "adminuser"
}

# VM admin password
variable "vm_admin_password" {
  description = "The admin password for the VMs."
  type = string
  default = "Password1234!"
}

# VM timezone
variable "timezone" {
  description = "The timezone for the VMs."
  type = string
  default = "UTC"
}


# allow extension operations
variable "allow_extension_operations" {
  description = "Allow extension operations for the VMs."
  type = bool
  default = true
}

# caching type
variable "caching" {
  description = "The caching type for the OS disk."
  type = string
  default = "ReadWrite"
}

# storage account type
variable "storage_account_type" {
  description = "The storage account type for the OS disk."
  type = string
  default = "Standard_LRS"
}

# disk size
variable "disk_size_gb" {
  description = "The disk size for the OS disk."
  type = number
  default = 127
}

# image publisher
variable "publisher" {
  description = "The publisher of the image."
  type = string
  default = "MicrosoftWindowsDesktop"
}

# image offer
variable "offer" {
  description = "The offer of the image."
  type = string
  default = "Windows-10"
}

# image sku
variable "sku" {
  description = "The sku of the image."
  type = string
  default = "20h2-evd"
}

# image version 
variable "image_version" {
  description = "The version of the image."
  type = string
  default = "latest"
}

# Primary access key
variable "primary_access_key" {
  description = "The primary access key for the storage account."
  type = string
}

# Storage account name
variable "storage_account_name" {
  description = "The name of the storage account."
  type = string
}