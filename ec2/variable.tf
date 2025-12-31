variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name for EC2 SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for EC2"
  type        = list(string)
}

variable "availability_zone" {
  description = "Availability Zone for EC2"
  type        = string
}
