provider "aws" {
    region    = "eu-west-3"
    profile   = ""
}

module "sg_module" {
    source   = "./sg_module"
}

module "ec2_module_1" {
    amiid       = "${local.amiid}"
    sg_id       = "${module.sg_module.sg_module_id}"
    source      = "./ec2_module"
}

locals {
    env = "${terraform.workspace}"

    # Local environment variables across workspaces

    amiid_env = {
        default      = "ami-06602da18c878f98d"
        staging      = "ami-06602da18c878f98d"
        production   = "ami-0f7cd40eac2214b37"
    }

    #The lookup function is used to call the local env variables
    amiid = "${lookup(local.amiid_env, local.env)}"
}

# This just outputs the local variable at runtime
output "envspecificoutput_variable" {
    value = "${local.amiid}"
}