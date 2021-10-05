locals {
    env = "${terraform.workspace}"

    vpcid_env = {
        default     = "vpc-11de0879"
        staging     = "vpc-11de0879"
        production  = "vpc-11de0879"
    }

    vpcid = "${lookup(local.vpcid_env, local.env)}"

     publicsubnetid_env = {
        default     = "subnet-6033ce08"
        staging     = "subnet-6033ce08"
        production  = "subnet-6033ce08"
    }

    publicsubnetid = "${lookup(local.publicsubnetid_env, local.env)}"

    publicsubnetid1_env = {
        default     = "subnet-c8613885"
        staging     = "subnet-c8613885"
        production  = "subnet-c8613885"
    }

    publicsubnetid1 = "${lookup(local.publicsubnetid1_env, local.env)}"

    privatesubnetid_env = {
        default     = "subnet-eeeffb95"
        staging     = "subnet-eeeffb95"
        production  = "subnet-eeeffb95"
    }

    privatesubnetid = "${lookup(local.privatesubnetid_env, local.env)}"

    amiid_env = {
        default     = "ami-06602da18c878f98d"
        staging     = "ami-06602da18c878f98d"
        production  = "ami-0f7cd40eac2214b37"
    }

    amiid = "${lookup(local.amiid_env, local.env)}"

    instance_type_env = {
        default     = "t2.micro"
        staging     = "t2.micro"
        production  = "t3.micro"
    }

    instance_type = "${lookup(local.instance_type_env, local.env)}"

    key_name_env = {
        default     = "aws_project_tf_staging"
        staging     = "aws_project_tf_staging"
        production  = "aws_project_tf_production"
    }

    key_name = "${lookup(local.key_name_env, local.env)}"

    asgdesired_env = {
        default     = "1"
        staging     = "1"
        production  = "2"
    }

    asgdesired = "${lookup(local.asgdesired_env, local.env)}"

    asgmin_env = {
        default     = "1"
        staging     = "1"
        production  = "2"
    }

    asgmin = "${lookup(local.asgmin_env, local.env)}"

    asgmax_env = {
        default     = "2"
        staging     = "2"
        production  = "4"
    }

    asgmax = "${lookup(local.asgmax_env, local.env)}"
}

output "vpcid" {
    value = "${local.vpcid}"
}

output "publicsubnetid" {
    value = "${local.publicsubnetid}"
  
}

output "publicsubnetid1" {
    value = "${local.publicsubnetid1}"
  
}

output "privatesubnetid" {
    value = "${local.privatesubnetid}"
  
}

output "env_suffix" {
    value = "${local.env}"
}

output "amiid" {
    value = "${local.amiid}"
}

output "instance_type" {
    value = "${local.instance_type}"
}

output "key_name" {
    value = "${local.key_name}"
}

output "asgdesired" {
    value = "${local.asgdesired}"
}

output "asgmin" {
    value = "${local.asgmin}"
}

output "asgmax" {
    value = "${local.asgmax}"
}