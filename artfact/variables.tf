variable "region" {
  description = "Region where the repository will be created"
  type        = string
}

variable "repo_name" {
  description = "Name of the Artifact Registry repository"
  type        = string
}

variable "repo_description" {
  description = "Description for the repository"
  type        = string
  default     = "Docker repository for storing container images"
}
