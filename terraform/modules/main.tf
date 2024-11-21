module "network" {
  source = "./module-network"
}

module "security" {
  source    = "./module-security"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

module "ec2" {
  source            = "./module-ec2"
  subnet_id         = module.network.subnet_id
  security_group_id = module.security.sg_id
}


