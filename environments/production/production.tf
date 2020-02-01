provider "aws" {
  version                 = "~> 2.7"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "infrastructure" {
  source = "../../modules/infrastructure"
  ami_id = "ami-02df9ea15c1778c9c"
}


