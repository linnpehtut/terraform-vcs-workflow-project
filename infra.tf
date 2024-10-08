resource "aws_vpc" "rancher_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.prefix}-rancher-vpc"
  }
}

resource "aws_internet_gateway" "rancher_gateway" {
  vpc_id = aws_vpc.rancher_vpc.id

  tags = {
    Name = "${var.prefix}-rancher-gateway"
  }
}

resource "aws_subnet" "rancher_subnet" {
  vpc_id = aws_vpc.rancher_vpc.id

  cidr_block        = "10.0.1.0/24"
  availability_zone = var.aws_zone

  tags = {
    Name = "${var.prefix}-rancher-subnet"
  }
}
