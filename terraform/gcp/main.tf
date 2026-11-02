
# Use the existing default VPC
data "google_compute_network" "default" {
  name = "default"
}

# Allow HTTP traffic to CloudPilot
resource "google_compute_firewall" "cloudpilot_http" {
  name    = "cloudpilot-allow-http"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["cloudpilot-web"]
}

# Create CloudPilot virtual machine
resource "google_compute_instance" "cloudpilot" {
  name         = "cloudpilot-gcp-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["cloudpilot-web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = data.google_compute_network.default.name

    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker
    docker run -d --restart unless-stopped -p 80:80 prameelarani0712/cloudpilot:latest
  EOF
}
