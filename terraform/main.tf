locals {
  project_id = "test_project"
}

provider "google" {
  project = local.project_id
  region  = "europe-west4"
}

resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

resource "google_compute_firewall" "allow-compute-ssh" {
  name    = "allow-compute-ssh"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = [
      "22",
      "6443"
    ]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}

resource "google_compute_firewall" "allow-internal-traffic" {
  name    = "allow-internal-traffic"
  network = "default"

  allow {
    protocol = "all"
  }

  source_ranges = [
    "10.10.104.0/24"
  ]
}