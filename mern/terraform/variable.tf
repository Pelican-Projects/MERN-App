variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "zone" {
  description = "region zone"
  type        = string
}

variable "credentials_file" {
  description = "Path to the service account JSON key file"
  type        = string
}
