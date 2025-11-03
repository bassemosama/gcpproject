variable "name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "zone" {
  type = string
}

variable "disk_image" {
  type    = string
  default = "debian-cloud/debian-11"
}

variable "subnet_id" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}
