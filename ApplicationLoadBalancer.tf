# Application Load Balancer
resource "aws_lb" "project_alb" {
  name               = "project-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.private1.id, aws_subnet.private2.id]
}

# Listener for ALB
resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.project_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.project_alb_target_group.arn
    type             = "forward"
  }
}

# Target Group for ALB
resource "aws_lb_target_group" "project_alb_target_group" {
  name     = "project-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project.id
}
# Retrieve instance IDs managed by the Auto Scaling Group
data "aws_autoscaling_groups" "project_asg" {
  names = ["project_asg"]  # Replace "web_asg" with the name of your ASG
}

# Register instances with the load balancer target group
resource "aws_lb_target_group_attachment" "project_alb_target_group_attachment" {
  count            = length(data.aws_autoscaling_groups.project_asg.names)
  target_group_arn = aws_lb_target_group.project_alb_target_group.arn
  target_id        = data.aws_autoscaling_groups.project_asg.id
  port             = 80
}

