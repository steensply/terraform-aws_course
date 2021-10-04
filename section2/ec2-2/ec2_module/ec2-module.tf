
variable "amiid" {
    type              = string  
    default           = "ami-0f7cd40eac2214b37"
}

variable "sg_id" {}
variable "ec2_name" {}

// EC2 Instance provisioning

resource "aws_instance" "Terraform_EC2_Instance" {
    ami                = "${var.amiid}"
    instance_type      = "t2.micro"
    key_name           = "terraform-course"
    vpc_security_group_ids    = [ "${var.sg_id}" ]

    tags = {
        Name           = "${var.ec2_name}"
    }
}
