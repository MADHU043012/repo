terraform {
    backend "s3" {
    bucket = "terraform-backup-s3-2025"
    region = "ap-southeast-2" 
       key = "tfstate"
    }
}

provider "aws" {
    

    region  = "ap-southeast-2"
}
resource "aws_instance" "EC2-instance" {
    ami =  var.ami_id
    instance_type =var.instance_type
  key_name =  var.key_name
vpc_security_group_ids  =["sg-01acedc7f409bec06"]
availability_zone ="ap-southeast-2a"
tags ={
    Name = "EC2-instance"
    
 }
}

  variable "ami_id" {
    default ="ami-0b3c832b6b7289e44"
 description = "this is my new ami_id"

  }
variable  "instance_type" {
default      = "t3.micro"
 description  = "EC2 instance type"
}

variable  "key_name"{
    description  = "EC2 key pair name"
  default        = "server-key"

}


  
  





  

  

  
  



