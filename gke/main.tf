resource "google_container_cluster" "this" {
  name                     = var.cluster_name
  location                 = var.location
  remove_default_node_pool  = true
  initial_node_count        = 1

  network    = var.vpc_id
  subnetwork = var.subnet_id

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master_ipv4_cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.management_cidr
      display_name = "management"
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-cluster-pods"
    services_secondary_range_name = "gke-services"
  }

  network_policy {
    enabled = true
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node_pool_name
  cluster    = google_container_cluster.this.name
  location   = var.location


  node_count = 1

  node_config {
    machine_type    = var.node_machine_type
    service_account = var.node_service_account


    disk_size_gb    = 20
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  
  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }
    depends_on = [
    google_container_cluster.this
  ]

}
