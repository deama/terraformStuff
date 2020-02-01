resource "aws_lb_target_group" "target_group" {
        name = "targetGroup"
        port = 80
        protocol = "HTTP"
        vpc_id = var.vpc_id
}

resource "aws_autoscaling_attachment" "to_load_balancer" {
	autoscaling_group_name = var.asg_id
	alb_target_group_arn = aws_lb_target_group.target_group.arn

	depends_on = [
		aws_lb_target_group.target_group
	]
}
