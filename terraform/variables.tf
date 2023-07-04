variable "address_space" {
  type = list(string)
  default = [
    "10.1.0.0/24",
    "10.2.0.0/24"
  ]
  description = "List of address spaces"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username"
}

variable "admin_password" {
  type        = string
  default     = "P@ssw0rd1234!"
  description = "Admin password"
}

variable "vm_size" {
  type        = string
  default     = "B1ls"
  description = "VM size"
}
