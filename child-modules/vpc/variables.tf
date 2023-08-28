variable "name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs_list" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "enable_nat_gateway" {
  type = bool
}

variable "env" {
  type = string
}
