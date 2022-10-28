variable "dev_instance_type" {
    type = string
    default = "t2.micro"
}

variable "prod_instance_type" {
    type = string
    default = "t3.micro"
}

variable "env" {
    type = string
    default = "dev"
}

variable "region" {
    type = string
    default = "us-east-2"
}

variable  "stage" {
    type = string
    default = "nonprod"
}

variable  "project" {
    type = string
    default = "cat"
}

variable "sg_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable  "ports" {
    type = list(string)
    default = [ "80" , "443" ,"22" ]
}

variable  "egress_port" {
    type = number
    default  = 0
}

variable "egress_protocol" {
type = number
default = "-1"
}