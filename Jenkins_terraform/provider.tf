provider "aws" {
  region  = var.AWS_REGION
  profile = "default"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}