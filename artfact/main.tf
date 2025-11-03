resource "google_artifact_registry_repository" "this" {
  provider      = google
  location      = var.region
  repository_id = var.repo_name
  description   = var.repo_description
  format        = "DOCKER"
}
