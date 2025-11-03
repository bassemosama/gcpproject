variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "management_cidr" {
  type = string
}

variable "region" {
  type = string
}

variable "master_ipv4_cidr" {
  type = string
}

variable "cluster_secondary_range" {
  type = string
}

variable "services_secondary_range" {
  type = string
}

variable "node_pool_name" {
  type = string
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_min_count" {
  type    = number
  default = 1
}

variable "node_max_count" {
  type    = number
  default = 3
}

variable "node_machine_type" {
  type    = string
  default = "e2-medium"
}

variable "node_service_account" {
  type = string
}
variable "location" {
  type = string
}
