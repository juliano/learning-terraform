provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "vpc-raaaaa" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags {
    Name = "VPC Malandra"
  }
}

resource "aws_internet_gateway" "salcifufu" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"
}

resource "aws_subnet" "subnet-gluglu" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"
  availability_zone = "eu-west-1a"
  cidr_block = "10.0.0.0/24"

  tags {
    Name = "Subnet Raaa gluglu"
  }
}

resource "aws_subnet" "subnet-piupiu" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"
  availability_zone = "eu-west-1b"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "Subnet Raaa piupiu"
  }
}

resource "aws_subnet" "subnet-ieie" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"
  availability_zone = "eu-west-1c"
  cidr_block = "10.0.2.0/24"

  tags {
    Name = "Subnet Raaa ié ié"
  }
}

resource "aws_route_table" "routetable-gluglu" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.salcifufu.id}"
  }

  tags {
    Name = "Route table gluglu"
  }
}

resource "aws_route_table" "routetable-piupiu" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.salcifufu.id}"
  }

  tags {
    Name = "Route table piupiu"
  }
}

resource "aws_route_table" "routetable-ieie" {
  vpc_id = "${aws_vpc.vpc-raaaaa.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.salcifufu.id}"
  }

  tags {
    Name = "Route table ié ié"
  }
}

resource "aws_route_table_association" "association-gluglu" {
  subnet_id = "${aws_subnet.subnet-gluglu.id}"
  route_table_id = "${aws_route_table.routetable-gluglu.id}"
}

resource "aws_route_table_association" "association-piupiu" {
  subnet_id = "${aws_subnet.subnet-piupiu.id}"
  route_table_id = "${aws_route_table.routetable-piupiu.id}"
}

resource "aws_route_table_association" "association-ieie" {
  subnet_id = "${aws_subnet.subnet-ieie.id}"
  route_table_id = "${aws_route_table.routetable-ieie.id}"
}
