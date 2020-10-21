variable "application_name" {
  type        = string
  description = "This is the application name used for tagging resources"
}
variable "region" {
  type        = string
  description = "This is the region used to create resources"
}
variable "subnet_cidr" {
  type        = string
  description = "This is the CIDR for the Subnet"
}
variable "machine_type" {
  type        = string
  description = "This is the machine type for the GKE cluster"
}
variable "master_ip" {
  type        = string
  description = "This is the IP address for the master node"
}

