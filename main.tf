terraform {
  backend "s3" {
    bucket = "terraform-backup-s3-2025"
    key    = "tfstate"
    region = "ap-southeast-2"
  }
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "ec2" {
  source = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.vpc.ec2_sg_id]
  availability_zone = var.availability_zone
}

module "nlb" {
  source     = "./modules/nlb"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "asg" {
  source            = "./modules/asg"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_ids        = module.vpc.public_subnet_ids
  target_group_arn = module.nlb.target_group_arn
}

module "s3_backup" {
  source      = "./modules/s3_backup"
  bucket_name = var.bucket_name
}
