# # Create a new load balancer
# resource "aws_elb" "web-elb" {
#   name               = "web-elb"
#   availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

#   listener {
#     instance_port     = 8000
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#   }

# #   health_check {
# #     healthy_threshold   = 2
# #     unhealthy_threshold = 2
# #     timeout             = 3
# #     target              = "HTTP:8000/"
# #     interval            = 30
# #     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"

# #   }

# #   instances                   = [aws_instance.foo.id]
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400

#   tags = {
#     Name = "web-elb"
#   }
# }