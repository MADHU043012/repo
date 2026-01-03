resource "aws_lb" "nlb" {
  name               = "nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "nlb" {
  name     = "nlb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

output "target_group_arn" { value = aws_lb_target_group.nlb.arn }
