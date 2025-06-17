terraform {
  backend "s3" {
    bucket         = "jenkinsbackup0085"
    key            = "terraform/infra.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}
