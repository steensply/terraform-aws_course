locals {
    env = "${terraform.workspace}"

    # sharing environment variables across workspaces

    env_suffix_env = {
        default    = "staging"
        staging    = "staging"
        production = "production"
    }

    #The lookup function is used to call the shared env variables
    env_suffix = "${lookup(local.env_suffix_env, local.env)}"
}

# This just outputs the shared variable at runtime
output "env_suffix" {
    value = "${local.env_suffix}"
}
