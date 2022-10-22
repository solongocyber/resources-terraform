resource "aws_key_pair" "terraform_key" {
    key_name = "ter_key"
    public_key = file("~/.ssh/id_rsa.pub")
}