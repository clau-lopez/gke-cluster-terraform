output "vpc_id" {
  value       = google_compute_network.vpc.id
  description = "This is vpc id used for other resources"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "This is subnet id used for the VPC"
}

output "subnet_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "This is subnet name used for the VPC"
}
output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "This is vpc name"
}