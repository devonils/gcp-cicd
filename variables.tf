variable "gcp_terraform_sa_email" {
  description = "Service account email of the account to impersonate to run Terraform."
  type        = string
}

variable "project_id" {
  description = "The default project id associated with the bootstrap project"
  type        = string
  default = "value"
}