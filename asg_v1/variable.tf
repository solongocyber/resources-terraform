variable "env"{
    type = string
    default = "dev"
}

variable "instance_type"{
    type = string
    description = "This is for a instance"
    default = "t2.micro"
}

variable "max_size"{
    type = number
    default = 5 # "" double " means it's string. Number doesn't "".
}

variable "min_size"{
    type = number
    default = 2 # "" double " means it's string. Number doesn't "".
}

variable "desired_capacity"{
    type = number
    default = 4 # "" double " means it's string. Number doesn't "".
}

variable "force_delete"{
    type = bool
    default = true
}

variable "vpc_zone_identifier"{
    type = list(string)
    default = ["subnet-0f7b40c9e8c06b924", "subnet-01452a396a84a7be9"]
}
