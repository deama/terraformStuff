variable "ingress_ports" {
	type = list(number)
	default = [22,80]
}

variable "open-internet" {
	type = list(string)
	default = ["0.0.0.0/0"]
}

variable "outbound-port" {
	type = number
	default = 0
}

variable "vpc_id" {
	
}
