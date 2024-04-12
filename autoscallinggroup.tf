# Auto Scaling Group
resource "aws_launch_configuration" "project_lc" {
  image_id        = var.ec2_ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.project_sg.id]
}

resource "aws_autoscaling_group" "project_asg" {
  launch_configuration = aws_launch_configuration.project_lc.name
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.private1.id, aws_subnet.private2.id]
  }