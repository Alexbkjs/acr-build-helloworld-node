variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "cloud-shell-storage-northeurope"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "questappacr"
}

variable "container_name" {
  description = "Name of the container instance"
  default     = "quest-app"
}

variable "image_name" {
  description = "Docker image name"
  default     = "questappacr.azurecr.io/quest-app-image:latest"
}

variable "location" {
  description = "Azure region to deploy to"
  default     = "East US"
}
