output "provedcode_subnet" {
  description = "The self link of the subnet to be used by the instances"
  value       = google_compute_subnetwork.provedcode-subnet.self_link
}