variable "env" {
    type = string
    default = "dev"
}



// variable "alb_tg_port" {
//     type = string
//     default = "80"

// }

// variable  "ports" {
//     type = list(string)
//     default = [ "80" , "443" ,"22" ]
// }

// variable  "egress_port" {
//     type = number
//     default  = 0
// }

// variable "egress_protocol" {
// type = number
// default = "-1"
// }

// variable "sg_cidr" {
//     type = string
//     default = "0.0.0.0/0"
// }

// variable "protocol" {
//     type = string
//     default = "tcp"
// }

// variable "internal" {
//     type = bool
//     default = false
// }

variable "ingress_rules" {
    type = map(any)
    default = {
        22 = "0.0.0.0/0"
        80 = "0.0.0.0/0"
        443 = "0.0.0.0/0"
    }
}