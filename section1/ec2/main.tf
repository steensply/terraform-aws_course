// Creation of EC2 instance on aws

provider "aws" {
    region         = "eu-west-3"
    profile        = "sleek-terraformcourse"
}

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


variable "amiid" {
    type              = string  
    default           = "ami-0f7cd40eac2214b37"
}

// EC2 Instance provisioning

resource "aws_instance" "Terraform_EC2_Instance" {
    ami                = "${var.amiid}"
    instance_type      = "t3.micro"
    key_name           = "terraform-course"
    vpc_security_group_ids    = [ "${aws_security_group.ec2_instance_sg.id}" ]

    tags = {
        Name           = "Terraform_EC2_Instance"
    }
}
