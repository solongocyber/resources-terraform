variable "ingress_port"{
    type = list(string)
    default = ["22", "80", "443"]
}

variable "cidr_blocks" {
    type = string
    default = "0.0.0.0/0"
}

variable "env"{
    type = string
    default = "dev"
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "vpc_zone_identifier" {
    type = list(string)
    default = [ "subnet-0f7b40c9e8c06b924", "subnet-01452a396a84a7be9", "subnet-09a5ffbb642a2264c" ]
}

variable "max_size" {
    type = number
    default = "5"
}
variable "min_size" {
    type = number
    default = "2"
}
variable "desired" {
    type = number
    default = "2"
}