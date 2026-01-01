variable "region" {
  default = "ap-southeast-2"
}
variable "vpc_cidr" {
  default = "172.25.0.0/16"
}

variable "private_subnet_cidr" {
  default = "172.25.16.0/20"
}

variable "public_cidr" {
  default = "172.25.32.0/20"
}
variable "availability_zone" {
  default = "ap-southeast-2a"
}
variable "instance_type" {
    default = "t3.micro"
}

variable "ami_id" {
  default = "ami-0b3c832b6b7289e44"
}

variable "key_name" {
  default = "server-key"
}

