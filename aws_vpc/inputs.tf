variable "region" {
  type        = string
  default     = "us-west-2"
  description = "region in which resource will be created"
}


variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "web_cidr" {
  type    = string
  default = "10.100.0.0/24"
}

variable "business_cidr" {
  type    = string
  default = "10.100.1.0/24"
}
variable "data_cidr" {
  type    = string
  default = "10.100.2.0/24"
}