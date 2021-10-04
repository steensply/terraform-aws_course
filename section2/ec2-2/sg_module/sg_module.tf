variable "vpcid" {
    type           = string
    default        = "vpc-11de0879"
}

// Security group creation for EC2 instance

resource "aws_security_group" "ec2_instance_sg" {
    name             = "ec2_instance_sg"
    description      = "security group for EC2 instance"
    vpc_id           = "${var.vpcid}"

    ingress {
        description     = "Inbound SSH"
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = [ "0.0.0.0/0" ]
    }

    egress {
        description     = "Outbound SSH"
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = [ "0.0.0.0/0" ]
    }

    tags = {
        Name        = "allow_ssh"
    }
}

output "sg_module_id" {
    value = "${aws_security_group.ec2_instance_sg.id}"
}