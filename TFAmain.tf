module "vpc" {
  source              = "./vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.102.0/24"
  availability_zone   = "ap-southeast-2a"
}


terraform {
    backend "s3" {
    bucket = "terraform-backup-s3-2025"
    region = "ap-southeast-2" 
       key = "tfstate"
    }
}
module "ec2" {
  source = "./ec2"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name

  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.vpc.ec2_sg_id]
  availability_zone  = var.availability_zone

  depends_on = [module.vpc] 
}



  
  





  

  

  
  



