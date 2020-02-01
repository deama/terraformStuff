resource "aws_lb" "balancer" {
	name = "loadBalancer"
	internal = false
	subnets = [var.subnet_id1, var.subnet_id2]
}

