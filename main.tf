terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
  }
  required_version = ">= 0.12" 
}
module "vpc" {
  source         = "./Modules/VPC"
  vpc_cidr_block = var.vpc_cidr_block
}

module "SecurityGroup" {
  source = "./Modules/SecurityGroup"
  vpc_id = module.vpc.vpc_id
}


module "EC2" {
  source           = "./Modules/EC2"
  key_name         = var.key_name
  public_subnet_id = module.vpc.public_subnet_id
  public_sg_id     = module.SecurityGroup.public_sg_id

  private_subnet_id = module.vpc.private_subnet_id
  private_sg_id     = module.SecurityGroup.private_sg_id
}



