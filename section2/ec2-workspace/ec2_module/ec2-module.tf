
variable "amiid" {
    type              = string  
    #default           = "ami-0f7cd40eac2214b37"
}

variable "sg_id" {}

module "shared_vars" {
    source = "../shared_vars"
}

// EC2 Instance provisioning

resource "aws_instance" "Terraform_EC2_Instance" {
    ami                = "${var.amiid}"
    instance_type      = "t2.micro"
    key_name           = "terraform-course"
    vpc_security_group_ids    = [ "${var.sg_id}" ]

    tags = {
        Name           = "EC2 Instance_${module.shared_vars.env_suffix}"
    }
}
