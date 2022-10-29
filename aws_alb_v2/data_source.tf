data "terraform_remote_state" "vpc_v3" {
  backend = "s3"
  config = {
    bucket = "aws-session-may2022-solongo"
    key    = "vpc_v3/terraform.tfstate"
    region = "us-east-2"
  }
}
