module "shared_vars" {
    source = "../shared_vars"
}

// Security group creation for EC2 instance

resource "aws_security_group" "public_sg" {
    name             = "public_sg_${module.shared_vars.env_suffix}"
    description      = "Public SG for ELB in ${module.shared_vars.env_suffix}"
    vpc_id           = "${module.shared_vars.vpcid}"

    ingress {
        #description     = "Inbound HTTP"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = [ "0.0.0.0/0" ]
    }

    egress {
        #description     = "Outbound HTTP"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = [ "0.0.0.0/0" ]
    }


}

resource "aws_security_group" "private_sg" {
    name             = "private_sg_${module.shared_vars.env_suffix}"
    description      = "Private SG for EC2 in ${module.shared_vars.env_suffix}"
    vpc_id           = "${module.shared_vars.vpcid}"

    ingress {
        #description     = "Inbound HTTP from Public SG"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        security_groups = [ "${aws_security_group.public_sg.id}" ]
    }

    egress {
        #description     = "Outbound HTTP"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = [ "0.0.0.0/0" ]
    }


}

output "publicsg_id" {
    value = "${aws_security_group.public_sg.id}"
}

output "privatesg_id" {
    value = "${aws_security_group.private_sg.id}"
}