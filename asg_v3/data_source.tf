data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "terraform_remote_state" "vpc_v3" {
  backend = "s3"
  config = {
    bucket = "aws-session-may2022-solongo"
    key    = "vpc_v3/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "alb_tg" {
backend = "s3" 
config  =  {
    bucket = "aws-session-may2022-solongo"
    key    = "aws_alb_v2/terraform.tfstate"
    region = "us-east-2"
  }


}