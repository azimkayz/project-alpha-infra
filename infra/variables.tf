variable "resource_group_name" {
  description = "Name of the Azure Resource Group for this project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. production, staging)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}