# Create GKE Cluster
resource "google_container_cluster" "gke-cluster" {
  name                     = "${var.application_name}-cluster"
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc_id
  subnetwork               = var.subnet_id

  master_authorized_networks_config {
    cidr_blocks {
      display_name = "bastion-host"
      cidr_block   = format("%s/32", google_compute_instance.bastion-host.network_interface.0.network_ip)


    }
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.1.0.0/21"
    services_ipv4_cidr_block = "10.4.0.0/19"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_ip
  }

}

# Create node pool
resource "google_container_node_pool" "node-pool" {
  name       = "${var.application_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# Allow access to the Bastion Host via SSH
resource "google_compute_firewall" "bastion-ssh" {
  name          = "myapp-bastion-ssh"
  network       = var.vpc_name
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["bastion"]
}
# The user-data script on Bastion instance provisioning
data "template_file" "startup_script" {
  template = <<-EOF
  sudo apt-get update -y
  sudo apt-get install kubectl
  sudo apt-get install git

  EOF

}

# Create Bastion Host for connecting GKE Cluster
resource "google_compute_instance" "bastion-host" {
  name         = "${var.application_name}-bastion-host"
  machine_type = var.machine_type
  zone         = "us-central1-a"
  tags         = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata_startup_script = data.template_file.startup_script.rendered
  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name

    access_config {
      // Ephemeral IP
    }
  }
}