provider "google" {
  project     = var.project_id  
  region      = var.region      
  zone        = var.zone        
  credentials = file(var.credentials_file)  # Path to my service account JSON file
}

resource "google_compute_instance" "mern_app_vm" {
  name         = "mern-vm"
  machine_type = "e2-small"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {} # This assigns a public IP
  }

  metadata_startup_script = file("startup.sh") # script that installs Docker and pulls image from my DockerHub

  tags = ["mern-server"]
}

resource "google_container_cluster" "primary" {
  name     = "mern-cluster"
  location = var.region

  node_config {
    machine_type = "e2-small"
  }

  initial_node_count = 2
}
