output "router_id" {
  value = google_compute_router.nat_router.id
}

output "nat_id" {
  value = google_compute_router_nat.nat.id
}
