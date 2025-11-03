

variable "region" {
  type    = string
  default = "us-central1"
}
variable "location" {
  type    = string
  default = "us-central1-a"
}

variable "vpc_name" {
  type    = string
  default = "bassem-vpc"
}

variable "management_subnet_name" {
  type    = string
  default = "management-subnet"
}

variable "management_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "restricted_subnet_name" {
  type    = string
  default = "restricted-subnet"
}

variable "restricted_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}
variable "vm_service_account_email" {
  type = string
  default = "mybassemservacc@bassem-477016.iam.gserviceaccount.com"
}
variable "gke_node_service_account" {
  type = string
  default = "mybassemservacc@bassem-477016.iam.gserviceaccount.com"
}
variable "repo_name" {
  description = "Artifact Registry repository name"
  type        = string
  default     = "bassem-repo"
}
