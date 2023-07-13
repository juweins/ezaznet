remote_state {
    backend = "azurerm"
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        resource_group_name = "tfstate-rg"
        storage_account_name = "2023tfstatestorage"
        container_name = "tfstatecontainer"
        key = "${path_relative_to_include()}/terraform.tfstate"
  }
}