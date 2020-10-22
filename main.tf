module "network" {
  source           = "./modules/network"
  application_name = var.application_name
  subnet_cidr      = var.subnet_cidr
}

module "gke" {
  source           = "./modules/gke"
  application_name = var.application_name
  region           = var.region
  machine_type     = var.machine_type
  master_ip        = var.master_ip
  vpc_id           = module.network.vpc_id
  subnet_id        = module.network.subnet_id
  subnet_name      = module.network.subnet_name
  vpc_name         = module.network.vpc_name
}