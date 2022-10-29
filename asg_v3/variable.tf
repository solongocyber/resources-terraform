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

variable "max_size" {
    type = number
    default = "5"
}
variable "min_size" {
    type = number
    default = "2"
}
variable "desired_capacity" {
    type = number
    default = "2"
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "public_subnet" {
    type = list(string)
    default = [ "subnet-07764aa187a3ac208", "subnet-081f20c30fff10aad", "subnet-0469792b9c70690fe" ]
}

variable "vpc_v3_id" {
    type = string
    default = "vpc-0f467ff8dbe26fd17"
}