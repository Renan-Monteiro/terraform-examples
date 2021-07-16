# nat us-east-1a
resource "aws_eip" "vpc_iep" {
    vpc = true
    tags = {
        Name = format("%s-eip", var.example_name)
    }
}

resource "aws_nat_gateway" "nat" {
    allocation_id   = aws_eip.vpc_iep.id
    subnet_id       = aws_subnet.public_subnet_1a.id

    tags = {
      Name = format("%s-nat-gateway", var.example_name)
    }  
}

resource "aws_route_table" "nat" {
    vpc_id = aws_vpc.example_vpc.id

    tags = {
        Name = format("%s-private-route", var.example_name)
    }
}

resource "aws_route" "nat_access" {
    route_table_id = aws_route_table.nat.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
}

# nat us-east-1b
resource "aws_eip" "vpc_iep_1b" {
    vpc = true
    tags = {
        Name = format("%s-eip-1b", var.example_name)
    }
}

resource "aws_nat_gateway" "nat-1b" {
    allocation_id   = aws_eip.vpc_iep_1b.id
    subnet_id       = aws_subnet.public_subnet_1b.id

    tags = {
      Name = format("%s-nat-gateway-1b", var.example_name)
    }  
}

resource "aws_route_table" "nat-1b" {
    vpc_id = aws_vpc.example_vpc.id

    tags = {
        Name = format("%s-private-route-1b", var.example_name)
    }
}

resource "aws_route" "nat_access-1b" {
    route_table_id = aws_route_table.nat-1b.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-1b.id
}


# nat us-east-1a
resource "aws_eip" "vpc_iep_1c" {
    vpc = true
    tags = {
        Name = format("%s-eip-1c", var.example_name)
    }
}

resource "aws_nat_gateway" "nat-1c" {
    allocation_id   = aws_eip.vpc_iep_1c.id
    subnet_id       = aws_subnet.public_subnet_1c.id

    tags = {
      Name = format("%s-nat-gateway-1c", var.example_name)
    }  
}

resource "aws_route_table" "nat-1c" {
    vpc_id = aws_vpc.example_vpc.id

    tags = {
        Name = format("%s-private-route-1c", var.example_name)
    }
}

resource "aws_route" "nat_access-1c" {
    route_table_id = aws_route_table.nat-1c.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-1c.id
}


