module "vpc" {
  source = "./vpc"
  name   = "bassem-vpc"
}

module "management_subnet" {
  source = "./managmentsubnet"
  name   = var.management_subnet_name
  cidr   = var.management_subnet_cidr
  region = var.region
  vpc_id = module.vpc.vpc_id
}
module "restricted_subnet" {
  source = "./restrictedsubnet"
  name   = var.restricted_subnet_name
  cidr   = var.restricted_subnet_cidr
  region = var.region
  vpc_id = module.vpc.vpc_id
}
module "nat_gateway" {
  source     = "./natgatway"
  router_name = "management-router"
  nat_name    = "management-nat"
  network_id  = module.vpc.vpc_id
  subnet_id   = module.management_subnet.subnet_id
  region      = var.region
}
module "private_vm" {
  source                = "./privatevm"
  name                  = "management-vm"
  machine_type          = "e2-medium"
  zone                  = "us-central1-a"
  disk_image            = "debian-cloud/debian-11"
  subnet_id             = module.management_subnet.subnet_id
  service_account_email = var.vm_service_account_email
  tags                  = ["allow-iap"]
}
module "gke_cluster" {
  source                  = "./gke"
  cluster_name            = "private-gke-cluster"
  vpc_id                  = module.vpc.vpc_id
  location                = var.location
  subnet_id               = module.restricted_subnet.subnet_id
  management_cidr         = module.management_subnet.subnet_cidr
  region                  = var.region
  master_ipv4_cidr        = "172.16.0.0/28"
  cluster_secondary_range  = "gke-cluster-pods"
  services_secondary_range = "gke-services"
  node_pool_name          = "primary-nodes"
  node_count              = 1
  node_min_count          = 1
  node_max_count          = 1
  node_machine_type       = "e2-medium"
  node_service_account    = var.gke_node_service_account
}
module "artifact_registry" {
  source           = "./artfact"
  region           = var.region
  repo_name        = var.repo_name
  repo_description = "Repository for GKE Docker images"
}
module "firewall_iap_ssh" {
  source        = "./firewall"
  firewall_name = "allow-iap-ssh"
  network       = module.vpc.vpc_id
  management_subnet_cidr = module.management_subnet.subnet_cidr
}

