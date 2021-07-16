resource "aws_security_group" "web_security_group" {
    name = "web sg"
    description = "web sg"

    dynamic "ingress" {
        for_each = var.sg_web_ports
        content {
            from_port    = ingress.value
            to_port      = ingress.value
            protocol     = "tcp"
            cidr_blocks  = ["0.0.0.0/0"]
        }
    }
  
}

resource "aws_security_group" "database_security_group" {
    name = "database sg"
    description = "database sg"

    dynamic "ingress" {
        for_each = var.sg_database_ports
        content {
            from_port    = ingress.value
            to_port      = ingress.value
            protocol     = "tcp"
            cidr_blocks  = ["0.0.0.0/0"]
        }
    }
  
}