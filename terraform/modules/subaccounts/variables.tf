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

variable "labels" {
  type        = map(set(string))
  description = "Labels for the subaccount"
  default     = {}
}

variable "group_role_assignments" {
  type = map(object({
    role_collection = string
    group           = string
  }))
  description = "Role collections to assign to identity provider groups"
  default     = {}
}

variable "idp_origin" {
  type        = string
  description = "Origin key of the identity provider the groups come from"
  default     = "sap.default"
}

variable "entitlements" {
  type = map(object({
    service_name = string
    plan_name    = string
    amount       = optional(number)
  }))
  description = "Additional service entitlements for the subaccount"
  default     = {}
}
