resource "aws_instance" "app1" {
        ami = "ami-05d3d7c9a0205c41f"
        instance_type = var.instance-type
        key_name = var.pem-key
        subnet_id = var.subnet_id
        vpc_security_group_ids = [var.vpc_security_group_ids]

        lifecycle {
                create_before_destroy = true
        }
}

resource "aws_instance" "app2" {
        ami = "ami-05afa70e220274598"
        instance_type = var.instance-type
        key_name = var.pem-key
        subnet_id = var.subnet_id
        vpc_security_group_ids = [var.vpc_security_group_ids]

        lifecycle {
                create_before_destroy = true
        }
}

