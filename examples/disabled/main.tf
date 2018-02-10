provider "aws" {
  region = "us-west-2"
}

#############################################################
# Data sources to get VPC and default security group details
#############################################################
data "aws_vpc" "default" {
  tags {
    Environment = "one"
  }
}

########################################################
# Security groups WILL NOT be created by these examples
########################################################
module "complete_sg_disabled" {
  source              = "../../"
  enabled             = false
  name                = "complete-sg"
  environment         = "testy"
  description         = "Security group with all available arguments set (this is just an example)"
  vpc_id              = "${data.aws_vpc.default.id}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "http_sg_disabled" {
  source              = "../../modules/http-80"
  enabled             = false
  name                = "http-sg"
  environment         = "testy"
  description         = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id              = "${data.aws_vpc.default.id}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
