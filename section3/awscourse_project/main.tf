provider "aws" {
    region    = "eu-west-3"
    profile   = ""
}

module "network_module" {
    source = "./network_module"
}

module "lb_module" {
    source        = "./lb_module"
    publicsg_id   = "${module.network_module.publicsg_id}"
}

module "autoscaling_module" {
    source       = "./autoscaling_module"
    privatesg_id = "${module.network_module.privatesg_id}"
    tg_arns      = "${module.lb_module.tg_arns}"
}