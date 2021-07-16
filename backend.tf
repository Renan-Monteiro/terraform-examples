terraform {
  backend "s3" {
    bucket         = "renan-learning-terraform-remote-backend"
    region         = "us-east-1"
    key            = "remote-backend.tfstate"
    dynamodb_table = "s3-state-lock"
  }
}