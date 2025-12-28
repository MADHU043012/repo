terraform {
    backend "s3"
    bucket = "terraform-backup-s3-2025"
    region = "ap-southeast-2" 
       key = "tfstate"
}

provider "aws" {
    

    region  = "ap-southeast-2"
}
resource "aws_instance" "EC2-instance" {
    ami ="ami-0b3c832b6b7289e44"
    instance_type ="t3.micro"
  key_name =  "server-key"
vpc_security_group_ids  =["sg-01acedc7f409bec06"]
availability_zone ="ap-southeast-2a"
tags ={
    Name = "EC2-instance"
    
 }
}

  

  

  
  



