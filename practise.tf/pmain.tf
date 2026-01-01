provider "aws" {
    region = "ap-southeast-2"
  
    }

resource  "aws_vpc" "project_vpc" {
    cidr_block ="172.25.0.0/16"

tags ={
    Name = "project-vpc"
   }
}

resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.project_vpc.id
    cidr_block ="172.25.16.0/20"
    availability_zone = "ap-southeast-2a"

 tags= {
    Name = "private-subnet"
 }
}
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block ="172.25.32.0/20"
  availability_zone = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.project_vpc.id

   tags = {
    Name = "my-igw"
  }
}
resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.project_vpc.id
    route {
        cidr_block ="0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
  tags ={
    Name ="my-route-table"
     }
  }
  resource "aws_route_table_association" "public_rt_assoc"{
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.my_route_table.id
  }

resource "aws_security_group" "my_sg" {
  name = "my-security-group"
  description = "allow ssh and http"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    
    from_port =22
    to_port =22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  } 
      ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port = 0
    to_port =0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "my-sg"
    }
  }
  resource "aws_instance" "my_ec2" {
    ami = "ami-0b3c832b6b7289e44"
instance_type = "t3.micro"
subnet_id = aws_subnet.public_subnet.id
availability_zone = "ap-southeast-2a"
vpc_security_group_ids = [aws_security_group.my_sg.id]
key_name = "server-key"

tags = {
    Name ="my-ec2"
     }
  }
    
    






  