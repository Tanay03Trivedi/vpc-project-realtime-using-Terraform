variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-007020fd9c84e18c7" # Amazon2 Linux AMI ID
}
