variable aws_region {
  description = "AWS region to deploy the infrastructure"
  default     = "us-east-1"
}

/* variable aws_profile {
  description = "AWS CLI profile to use for authentication"
  default     = "default"
}*/

variable vpc_cidr {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable public_subnet {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable app_subnetA {
  description = "CIDR block for the app tier subnet A - private"
  default     = "10.0.3.0/24"
}

variable app_subnetB {
  description = "CIDR block for the app tier subnet B - private"
  default     = "10.0.4.0/24"
}

variable az_1 {
  description = "Availability zone 'a' for the default AWS region"
  default     = "us-east-1a"
}

variable az_2 {
  description = "Availability zone 'b' for the default AWS region"
  default     = "us-east-1b"
}

variable my_ip {
  description = "My IP address"
  default     = "102.88.37.113/32"
}

variable instance_type {
  description = "EC2 instance type for all instances"
  default     = "t2.micro"
}
