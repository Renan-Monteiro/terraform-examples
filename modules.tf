module "network" {
  source = "./modules/network"

  example_name = var.example_name
  aws_region   = var.aws_region
}

# module "elb" {
#   source = "./modules/elb"

#   example_name  = var.example_name
#   aws_region    = var.aws_region

# }

module "autoscaling" {
  source = "./modules/autoscaling"

  example_name          = var.example_name
  aws_region            = var.aws_region
  nodes_instances_sizes = var.nodes_instances_sizes
  subnets-id            = [module.network.public_subnet_1a, module.network.public_subnet_1b, module.network.public_subnet_1c]
  private-subnets-id    = [module.network.private_subnet_1a, module.network.private_subnet_1b, module.network.private_subnet_1c]
}