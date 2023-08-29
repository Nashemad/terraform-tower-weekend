module "vpc" {
  source             = "./child-modules/vpc"
  name = var.name
  vpc_cidr = var.vpc_cidr
  azs_list = var.azs_list
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  enable_nat_gateway = true
  env        = var.env
}

module "ec2" {
  source = "./child-modules/ec2"
  instance_type = "t2.large"
  subnet_id = module.vpc.public_subnets_ids[1]
}

terraform {
  backend "s3" {
    bucket = "terraform-s3-bucket-statesfile"
    key    = "terraform-today's-practice/terraform.tfstate"
    region = "us-east-1"
  }
}
