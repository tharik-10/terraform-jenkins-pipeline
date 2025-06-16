terraform {
  backend "s3" {
    bucket         = "terraform-cicd-state-bucket"
    key            = "terraform/infra.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
