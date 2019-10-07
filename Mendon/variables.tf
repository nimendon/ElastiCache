variable "aws_region" {                                                     # Defining a variable for Region
  description = "Region for the VPC"
  default = "us-east-1"
} 

variable "vpc_cidr_block" {
  description = "The top-level CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "namespace" {
  description = "Default namespace"
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
}

variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 2
}
