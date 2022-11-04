terraform {
  backend "s3" {
    bucket = "aws-session-may2022-solongo"
    key    = "aws_alb_v2/terraform.tfstate"
    region = "us-east-2"
  }
}
