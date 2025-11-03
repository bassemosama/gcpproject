resource "google_compute_network" "mybassemvpc" {
  name                    = var.name
  auto_create_subnetworks = false
}
