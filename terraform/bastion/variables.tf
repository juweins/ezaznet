variable "address_space" {
  type = list(string)
  default = [
    "10.1.0.0/24",
    "10.2.0.0/24"
  ]
  description = "List of address spaces"
}