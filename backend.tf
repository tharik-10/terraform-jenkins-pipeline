terraform {
  backend "s3" {
    bucket         = "mongodb-tool"
    key            = "terraform/infra.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
