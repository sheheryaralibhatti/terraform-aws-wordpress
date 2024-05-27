module "vpc" {
  source = "./modules/vpc"

  cidr_block           = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
  name                 = var.name
}

module "security_group" {
  source = "./modules/security-groups"
  name   = var.name
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  name               = var.name
  ami                = var.ami
  instance_type      = var.instance_type
  subnets            = module.vpc.public_subnets
  security_groups    = [module.security_group.instance_sg]
  elb_security_group = module.security_group.elb_sg
}

module "rds" {
  source = "./modules/rds"

  name              = var.name
  allocated_storage = var.db_allocated_storage
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  security_group    = module.security_group.rds_sg
  subnets           = module.vpc.private_subnets
}

