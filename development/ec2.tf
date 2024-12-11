module "dev_ec2" {
  source = "../modules/compute"
  environment = module.dev_vpc.environment
  amis = {
    us-east-1 = "ami-0e2c8caa4b6378d8c"
    #us-east-2 = "ami-id"
  }
  aws_region = var.aws_region
  key_name = "SecOps-Key"
  publicsubnets = module.dev_vpc.public-subnet
  privatesubnets = module.dev_vpc.private-subnet
  sg_id = module.dev_sg.sg_id
  vpc_name = module.dev_vpc.vpc_name
}