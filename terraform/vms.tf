resource "google_compute_instance" "kubernetes_master" {
  count        = 3
  name         = "kubernetes-master-${count.index + 1}"
  machine_type = "e2-small"
  zone         = var.zone
  allow_stopping_for_update = true
  boot_disk {
    auto_delete = "true"
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 10
    }
  }
  network_interface {
    subnetwork = var.subnetwork
    access_config {}
  }
  scheduling {
    preemptible = true
    automatic_restart = false
  }
}

resource "google_compute_instance" "kubernetes_worker" {
  count        = 2
  name         = "kubernetes-worker-${count.index + 1}"
  machine_type = "e2-small"
  zone         = var.zone
  allow_stopping_for_update = true
  boot_disk {
    auto_delete = "true"
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 10
    }
  }
  network_interface {
    subnetwork = var.subnetwork
    access_config {}
  }
  scheduling {
    preemptible = true
    automatic_restart = false
  }
}

resource "google_compute_instance" "kubernetes_lb" {
  name         = "kubernetes-lb"
  machine_type = "e2-micro"
  zone         = var.zone
  allow_stopping_for_update = true
  boot_disk {
    auto_delete = "true"
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 10
    }
  }
  network_interface {
    subnetwork = var.subnetwork
    access_config {}
  }
}
