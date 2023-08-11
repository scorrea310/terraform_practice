variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-09f67f6dc966a7829" # Amazon Linux 2023 AMI 2023.1.20230809.0 x86_64 HVM kernel-6.1 // us-west-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}
