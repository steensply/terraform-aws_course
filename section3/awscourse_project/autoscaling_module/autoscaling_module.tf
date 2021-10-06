module "shared_vars" {
    source = "../shared_vars"
}

variable privatesg_id {}
variable tg_arns {}

resource "aws_launch_configuration" "sampleapp_lc" {
  name_prefix        = "sampleapp-lc-${module.shared_vars.env_suffix}"
  image_id           = "${module.shared_vars.amiid}"
  instance_type      = "${module.shared_vars.instance_type}"
  key_name           = "${module.shared_vars.key_name}"
  user_data          = "${file("./assets/userdata.txt")}"
  security_groups    = [ "${var.privatesg_id}"]

}

resource "aws_autoscaling_group" "sampleapp_asg" {
  name                 = "sampleapp-asg-${module.shared_vars.env_suffix}"
  launch_configuration = "${aws_launch_configuration.sampleapp_lc.name}"
  min_size             = "${module.shared_vars.asgmin}"
  max_size             = "${module.shared_vars.asgmax}"
  desired_capacity     = "${module.shared_vars.asgdesired}"
  vpc_zone_identifier  = [ "${module.shared_vars.publicsubnetid}" ]
  target_group_arns    = ["${var.tg_arns}"]

  tags = [
    {
        "key"                 = "Name"
        "value"               = "SampleApp_${module.shared_vars.env_suffix}"
        "propagate_at_launch" = true
    },
    {
        "key"                 = "Environment"
        "value"               = "${module.shared_vars.env_suffix}"
        "propagate_at_launch" = true
    },
]
}