resource "aws_vpc" "vpc" {
	cidr_block = var.vpc-cidr-block
}

resource "aws_subnet" "subnet" {
	cidr_block = var.pub-snA-cidr-block
	availability_zone = data.aws_availability_zones.available.names[0]
	vpc_id = aws_vpc.vpc.id

	map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
	cidr_block = var.pub-snA-cidr-block2
	availability_zone = data.aws_availability_zones.available.names[1]
	vpc_id = aws_vpc.vpc.id

	map_public_ip_on_launch = true
}

data "aws_availability_zones" "available" {
	state = "available"
}

resource "aws_internet_gateway" "gateway" {
	vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "route" {
	vpc_id = aws_vpc.vpc.id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.gateway.id
	}
}

resource "aws_route_table_association" "association" {
	subnet_id = aws_subnet.subnet.id
	route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "association2" {
	subnet_id = aws_subnet.subnet2.id
	route_table_id = aws_route_table.route.id
}
