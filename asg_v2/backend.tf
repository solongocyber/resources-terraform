terraform {
  backend "s3" {
    bucket = "aws-session-may2022-solongo"
    key    = "session-5/terraform.tfstate"
    region = "us-east-2"
  }
}
