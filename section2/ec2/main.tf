provider "aws" {
    region = "eu-west-3"
    profile = "sleek-terraformcourse"
}

module "ec2_module" {
    source = "./ec2_module"
}