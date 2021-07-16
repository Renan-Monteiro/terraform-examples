variable "example_name" {
    default = "learning-terraform"
}

variable "aws_region" {
    default = "us-east-1"
}

variable "sg_web_ports" {
    type        = list(number)
    description = "list of ingress ports"
    default = [ 80, 443 ]
}

variable "sg_database_ports" {
    type        = list(number)
    description = "list of ingress ports"
    default = [ 5432, 3306 ]
}

variable "public_cidr_block" {
    type        = list(string)
    description = "cidr private subnets"
    default = [ "10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20" ] 
}

variable "private_cidr_block" {
    type        = list(string)
    description = "cidr private subnets"
    default = [ "10.0.48.0/20", "10.0.64.0/20", "10.0.80.0/20" ] 
}

