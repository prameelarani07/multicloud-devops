
output "gcp_instance_name" {
  description = "CloudPilot GCP VM name"
  value       = google_compute_instance.cloudpilot.name
}

output "gcp_public_ip" {
  description = "CloudPilot GCP public IP address"
  value       = google_compute_instance.cloudpilot.network_interface[0].access_config[0].nat_ip
}

output "cloudpilot_gcp_url" {
  description = "CloudPilot application URL on GCP"
  value       = "http://${google_compute_instance.cloudpilot.network_interface[0].access_config[0].nat_ip}"
}
