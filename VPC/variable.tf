variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.102.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "availability_zone" {
  type    = string
  default = "ap-southeast-2a"
}

variable "ami_id" {
  description = "This is my new AMI ID"
  type        = string
  default     = "ami-0b3c832b6b7289e44"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}


variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "server-key"
}

variable "security_group_id" {
  description = "Security Group ID for EC2"
  type        = string
  default     = "sg-053fa50c4ed211d44"
}
