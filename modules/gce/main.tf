// Frontend instance
resource "google_compute_instance" "frontend" {
  // Basic instance configuration
  name         = "tf-frontend"
  machine_type = "e2-small"
  zone         = var.gcp_zone
  tags         = ["frontend"]
  depends_on   = [google_compute_instance.backend]

  // Startup scripts
  metadata_startup_script = join("\n", [
    file("scripts/install_docker.sh"),
    format("export BACKEND_IP=%s", google_compute_instance.backend.network_interface[0].access_config[0].nat_ip),
    file("scripts/run_frontend.sh")
  ])

  // Boot disk configuration
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  // Network configuration
  network_interface {
    subnetwork = var.provedcode_subnet
    access_config {}
  }

  metadata = {
    ssh-keys = "provedcode:${file("keys/id_rsa.pub")}"
  }
}

// Backend instance
resource "google_compute_instance" "backend" {
  // Basic instance configuration
  name         = "tf-backend"
  machine_type = "e2-small"
  zone         = var.gcp_zone
  project      = var.gcp_project
  tags         = ["backend"]

  // Startup scripts
  metadata_startup_script = join("\n", [
    file("scripts/install_docker.sh"),
    file("scripts/env.sh"),
    file("scripts/run_backend.sh")
  ])

  // Boot disk configuration
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  // Network configuration
  network_interface {
    subnetwork = var.provedcode_subnet
    access_config {}
  }

  metadata = {
    ssh-keys = "provedcode:${file("keys/id_rsa.pub")}"
  }
}