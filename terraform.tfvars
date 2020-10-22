application_name = "my-app"
region           = "us-central1"
subnet_cidr      = "10.2.0.0/16"

# Variables for node pool configuration
machine_type = "n1-standard-1"
master_ip    = "10.0.0.0/28"

cluster_ipv4_cidr_block  = "10.1.0.0/21"
services_ipv4_cidr_block = "10.4.0.0/19"