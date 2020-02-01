module "aws_vpc" {
	source = "./VPC"
}

module "aws_sg" {
	source = "./SecurityGroup"

	vpc_id = module.aws_vpc.vpc_id
}

module "aws_autoscale" {
	source = "./autoScale"

	security_group_ids = module.aws_sg.aws_wsg_id
	aws_subnet_id = module.aws_vpc.public_subnet_id
	aws_subnet_id2 = module.aws_vpc.public_subnet_id2
	ami_id = var.ami_id
}

module "aws_load_balancer" {
	source = "./loadBalancer"
	
	subnet_id1 = module.aws_vpc.public_subnet_id
	subnet_id2 = module.aws_vpc.public_subnet_id2
}

module "aws_target_group_and_attachment" {
	source = "./targetGroup"
	
	asg_id = module.aws_autoscale.asg_id
	vpc_id = module.aws_vpc.vpc_id
}
