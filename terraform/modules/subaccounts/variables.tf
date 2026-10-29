variable "name" {
  type        = string
  description = "Subaccount name"
}

variable "subdomain" {
  type        = string
  description = "Subaccount subdomain"
}

variable "region" {
  type        = string
  description = "BTP region e.g. us10"
}

variable "cfname" {
  type        = string
  description = "Cloud Foundry environment instance name"
}

variable "admin_email" {
  type        = string
  description = "Email of the subaccount administrator"
}

variable "labels" {
  type        = map(set(string))
  description = "Labels for the subaccount"
  default     = {}
}
