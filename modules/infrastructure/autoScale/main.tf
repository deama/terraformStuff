resource "aws_launch_configuration" "launch1" {
	name_prefix = "terraform-launch1"
	image_id = var.ami_id
	instance_type = "t2.micro"
	key_name = "test"

	user_data = file("${path.module}/userData/start.sh")
	
	security_groups = [var.security_group_ids]

	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_autoscaling_group" "scale1" {
	name = "scale_app1"
	launch_configuration = aws_launch_configuration.launch1.name
	min_size = 1
	max_size = 2
	desired_capacity = 1
	vpc_zone_identifier = [var.aws_subnet_id, var.aws_subnet_id2]


	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_autoscaling_schedule" "off" {
	scheduled_action_name = "off"
	min_size = 0
	max_size = 0
	desired_capacity = 0
	recurrence = "0 3 * * *"
	autoscaling_group_name = aws_autoscaling_group.scale1.name
}

resource "aws_autoscaling_schedule" "on" {
	scheduled_action_name = "on"
	min_size = 1
	max_size = 3
	desired_capacity = 1
	recurrence = "0 4 * * *"
	autoscaling_group_name = aws_autoscaling_group.scale1.name
}
