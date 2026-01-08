variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.102.0/24"
}

variable "availability_zone" {
  default = "ap-southeast-2a"
}

variable "ami_id" {
  default = "ami-0b3c832b6b7289e44" 
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "server-key"           
}

variable "bucket_name" {
  default = "terraform-backup-s3-2025"
}

