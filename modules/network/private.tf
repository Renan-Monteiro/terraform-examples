resource "aws_subnet" "private_subnet_1a" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = var.private_cidr_block[0]

    availability_zone = format("%sa", var.aws_region)

    tags = {
        Name = format("%s-private-1a", var.example_name)
    }
}

resource "aws_subnet" "private_subnet_1b" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = var.private_cidr_block[1]

    availability_zone = format("%sb", var.aws_region)

    tags = {
        Name = format("%s-private-1b", var.example_name)
    }
}

resource "aws_subnet" "private_subnet_1c" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = var.private_cidr_block[2]

    availability_zone = format("%sc", var.aws_region)

    tags = {
        Name = format("%s-private-1c", var.example_name),
    }
}

resource "aws_route_table_association" "private1a" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "private1b" {
  subnet_id = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "private1c" {
  subnet_id = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.nat.id
}