output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.new_vpc.id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public_rt.id
}

output "ec2_sg_id" {
  description = "Security Group ID for EC2"
  value       = aws_security_group.ec2_sg.id
}
