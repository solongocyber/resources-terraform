variable "env" {
    type = string
    default = "dev"
}

variable "app_port" {
    type = number
    default = 80
}

variable "vpc_id" {
    type = string
    default = "vpc-0de4a86ead40d6439"
}

variable "subnet" {
    type =list(string)
    default = ["subnet-0f7b40c9e8c06b924", "subnet-01452a396a84a7be9"]
}