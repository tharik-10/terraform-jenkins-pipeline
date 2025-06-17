variable "region" {
  default = "us-west-2"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ami_id" {
  default = "ami-020cba7c55df1f615" 
}

variable "instance_type" {
  default = "t2.micro"
}
