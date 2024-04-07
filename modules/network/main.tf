// VPC
resource "google_compute_network" "main" {
  name                    = "main-vpc"
  auto_create_subnetworks = false
  project                 = var.gcp_project
}

// Subnet
resource "google_compute_subnetwork" "provedcode-subnet" {
  name          = "provedcode-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.gcp_region
  network       = google_compute_network.main.self_link
  project       = var.gcp_project
}