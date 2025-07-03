resource "aws_vpc" "myvpc" {
        cidr_block = var.cidr
        enable_dns_support = true
        enable_dns_hostnames = true

        tags = {
                Name = "TF-vpc"
        }
}
##### create subnets #####

resource "aws_subnet" "pub-sub1" {
        vpc_id = aws_vpc.myvpc.id
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = true

        tags = {
                Name = "TF public-subnet-1a"
        }
}
resource "aws_subnet" "pub-sub2" {
        vpc_id = aws_vpc.myvpc.id
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = true

        tags = {
                Name = "TF public-subnet-1b"
        }
}
##### create internet gateway #####

resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.myvpc.id
        tags = {
                Name = "TF-igw"
        }
}
##### create route tables #####

resource "aws_route_table" "myrt" {
        vpc_id = aws_vpc.myvpc.id

        route {
                cidr_block = "0.0.0.0/0"
                gateway_id = aws_internet_gateway.igw.id

        }

        tags = {
                Name = "TF routing-table"
        }
}
##### subnet association #####

resource "aws_route_table_association" "rta1" {
        subnet_id = aws_subnet.pub-sub1.id
        route_table_id = aws_route_table.myrt.id
}
resource "aws_route_table_association" "rta2" {
        subnet_id = aws_subnet.pub-sub2.id
        route_table_id = aws_route_table.myrt.id
}
