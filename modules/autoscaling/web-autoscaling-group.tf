resource "aws_launch_template" "launch-public" {
  name_prefix   = "launch-public-1a"
  image_id      = data.aws_ami.ami.id
  instance_type = var.nodes_instances_sizes

  tags = {
      "Name" = format("%s-launch-public-template", var.example_name)
  }
  
}

resource "aws_autoscaling_group" "autoscaling" {
  vpc_zone_identifier = var.subnets-id
  desired_capacity    = 3
  max_size            = 6
  min_size            = 3

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.launch-public.id
      }   
    }
  }

  tag {
    key                 = "Name"
    value               = format("%s-autoscaling", var.example_name)
    propagate_at_launch = true
  }
  
}
