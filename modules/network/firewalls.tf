resource "google_compute_firewall" "frontend_firewall" {
  name    = "allow-http-frontend"
  project = var.gcp_project
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["frontend"]
}

resource "google_compute_firewall" "backend_firewall" {
  name    = "allow-http-backend"
  project = var.gcp_project
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["backend"]
}

resource "google_compute_firewall" "ssh_firewall" {
  name    = "allow-ssh"
  project = var.gcp_project
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}