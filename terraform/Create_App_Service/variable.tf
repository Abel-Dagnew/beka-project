# variables.tf
variable "resource_group_name" {
  type    = string
  default = "abel_RG"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "app_service_plan_name" {
  type    = string
  default = "AbelSP"
}

variable "app_service_name" {
  type    = string
  default = "Abel-terraform3"
}