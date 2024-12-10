module "dev_sg" {
  source = "../modules/sg"
  vpc_name = module.dev_vpc.vpc_name
  vpc_id = module.dev_vpc.vpc_id
  ingress_service = ["80", "8080", "443", "8443", "22", "3306", "1900", "1443"]
  environment = module.dev_vpc.environment
}