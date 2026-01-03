
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "subnet_ids" { type = list(string) }
variable "target_group_arn" { type = string }


