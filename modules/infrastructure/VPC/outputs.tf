output "vpc_id" {
	value = aws_vpc.vpc.id
}

output "public_subnet_id" {
	value = aws_subnet.subnet.id
}

output "public_subnet_id2" {
	value = aws_subnet.subnet2.id
}
