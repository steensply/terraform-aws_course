provider "aws" {
    region  = "eu-west-3"
    profile = ""
}

module "sg_module" {
    source   = "./sg_module"
}

module "ec2_module_1" {
    sg_id    = "${module.sg_module.sg_module_id}"
    ec2_name = "EC2 Instance 1 from module"
    source = "./ec2_module"
}

module "ec2_module_2" {
    sg_id    = "${module.sg_module.sg_module_id}"
    ec2_name = "EC2 Instance 2 from module"
    source = "./ec2_module"
}