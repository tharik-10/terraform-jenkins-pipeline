variable "region" {
  default = "us-west-2"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ami_id" {
  default = "ami-05f991c49d264708f" 
}

variable "instance_type" {
  default = "t2.micro"
}
