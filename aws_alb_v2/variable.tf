variable "env" {
    type = string
    default = "dev"
}

variable "vpc_id" {
    type = string
    default = "vpc-0de4a86ead40d6439"
}

variable "subnet" {
    type =list(string)
    default = ["subnet-0f7b40c9e8c06b924", "subnet-01452a396a84a7be9"]
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

variable "alb_tg_port" {
    type = string
    default = "80"

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

variable "sg_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "internal" {
    type = bool
    default = false
}

variable "lb_type" {
    type = string
    default = "application"
}