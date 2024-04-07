#GCP Provider

provider "google" {
    credentials = file(var.gcp_svc_key)
    project     = var.gcp_project
    region      = var.gcp_region
}

module "network" {
  source = "./modules/network"
  gcp_project = var.gcp_project
  gcp_region  = var.gcp_region
}

module "gce" {
  source = "./modules/gce"
  provedcode_subnet = module.network.provedcode_subnet
  gcp_project = var.gcp_project
  gcp_zone = var.gcp_zone
}
