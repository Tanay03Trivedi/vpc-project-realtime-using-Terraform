resource "aws_instance" "bastion" {
   ami             = var.ec2_ami_id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public1.id
  key_name        = var.key_ssh  # Specify your SSH key pair name
  security_groups = [aws_security_group.project_sg.id]
   
  
}