variable "application_name" {
  type        = string
  description = "This is the application name used for tagging resources"
}
variable "region" {
  type        = string
  description = "This is the region used to create resources"
}
variable "vpc_id" {
  type        = string
  description = "This is vpc id used for other resources"
}

variable "subnet_id" {
  type        = string
  description = "This is subnet id used for the VPC"
}
variable "machine_type" {
  type        = string
  description = "This is the machine type for the GKE cluster"
}
variable "master_ip" {
  type        = string
  description = "This is the IP address for the master node"
}
variable "subnet_name" {
  type        = string
  description = "This is subnet name used for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "This is vpc name"
}
variable "cluster_ipv4_cidr_block" {
  type        = string
  description = "This is the CIDR block to Cluster"
}
variable "services_ipv4_cidr_block" {
  type        = string
  description = "This is the CIDR block to Services"
}