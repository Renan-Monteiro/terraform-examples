provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}
provider "aws" {
  region = "us-east-2"
  alias  = "ohio"
}

data "aws_ip_ranges" "american_ec2" {
  regions  = ["us-east-1", "us-east-2"]
  services = ["ec2"]
}

resource "aws_instance" "frontend" {

  count         = 2
  provider      = "aws.virginia"
  ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  key_name      = "mykeypair"
  vpc_security_group_ids = ["${aws_security_group.frontend.id}"]

  tags = {
    Name       = "tf-frontend-01"
    App        = "devops-demo"
    Maintainer = "Renan"
  }

  lifecycle {
    prevent_destroy = true
  }

  timeouts {
    create = "7m"
    delete = "1h"
  }
}

resource "aws_security_group" "frontend" {

  name        = "frontend"
  description = "Security configs for Fronted APP"
  provider = "aws.virginia"

  ingress = [ {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open SSH port to all"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks      = data.aws_ip_ranges.american_ec2.cidr_blocks
    ipv6_cidr_blocks = data.aws_ip_ranges.american_ec2.ipv6_cidr_blocks
    prefix_list_ids = [ "null" ]
    security_groups = [ "null" ]
    self = false    
  } ]
  

  tags = {
    "role" = "frontend"
  }

}