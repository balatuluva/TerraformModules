module "prod_vpc" {
  source = "../modules/network"
  vpc_cidr           = "192.168.0.0/16"
  vpc_name           = "prod_vpc"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_cidr_block  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_cidr_block = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
  environment        = "Production"
}

module "prod_sg" {
  source = "../modules/sg"
  vpc_name = module.prod_vpc.vpc_name
  vpc_id = module.prod_vpc.vpc_id
  ingress_service = ["80", "8080", "443", "8443", "22", "3306", "1900", "1443"]
  environment = module.prod_vpc.environment
}