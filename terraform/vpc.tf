# VPC
resource "google_compute_network" "default-network" {
  name                    = "default"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "default-europe-west4-a-subnet" {
  name          = "default-europe-west4-a"
  region        = "europe-west4"
  network       = google_compute_network.default-network.name
  ip_cidr_range = "10.10.104.0/24"
  private_ip_google_access = true
}