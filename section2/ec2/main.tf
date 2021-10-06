provider "aws" {
    region = "eu-west-3"
    profile = ""
}

module "ec2_module" {
    source = "./ec2_module"
}