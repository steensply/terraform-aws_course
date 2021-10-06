# starting the provider and specifying the profile.
# Adding secret_key and access_key in the configuration file is a security risk
# Always use the profile in the configuration
provider "aws" {
    region = "eu-west-3"
    profile = ""
}

// Handling strings

variable "firststring" {
    type = string
    default = "this is my first string"
}

variable "laststring" {
    type = string
    default = <<EO
this is my last string
i will not write another
EO
}
output "myfirstoutput" {
    value = "${var.firststring}"
  
}

output "mylastoutput" {
    value = "${var.laststring}"
}

// Handling maps

variable "mymap" {
    type = map
    default = {
        "eu-west" = "ami-1"
        "eu-east" = "ami-2"
    }
}

output "mapoutput" {
    value = "${var.mymap["eu-west"]}"
}

// Handling lists and arrays

variable "mylist" {
    type = list
    default = ["first", "second", "third", "forth"]
}

output "listoutput" {
    value = "${var.mylist}"
}

// Handling booleans

variable "testboolean" {
    default = true
}

output "booleanoutput" {
    value = "${var.testboolean}"
}

// Handling variables

variable "myvariable" {
    type = string
}

output "outputvariable" {
    sensitive = true
    value = "${var.myvariable}"
}

