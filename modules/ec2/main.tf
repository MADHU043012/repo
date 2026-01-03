
resource "aws_instance" "ec2-sg" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = base64encode(
    <<EOF
#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<h1> this is a terraform ec2 instance</h1>" > /var/www/html/index.html
EOF
  )

  tags = { Name = "EC2-Instance" }
}
