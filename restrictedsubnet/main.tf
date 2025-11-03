resource "google_compute_subnetwork" "this" {
  name                     = var.name
  ip_cidr_range            = var.cidr
  region                   = var.region
  network                  = var.vpc_id
  private_ip_google_access = true 
   secondary_ip_range {
    range_name    = "gke-cluster-pods"
    ip_cidr_range = "10.4.0.0/16"
  }

  secondary_ip_range {
    range_name    = "gke-services"
    ip_cidr_range = "10.5.0.0/20"
  } 
}


