variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type        = string
  description = "The DigitalOcean region slug for the VPC's location."
  default     = "sgp1"
}

variable "image" {
  type    = string
  default = "ubuntu-22-04-x64"
}

variable "total_instances" {
  description = "Total number of managers in cluster"
  default     = 1
}

variable "name" {
  description = "Prefix for name of manager nodes"
  default     = "manager"
}

variable "size" {
  description = "Droplet size of manager nodes"
  default     = "s-1vcpu-1gb-amd"
}

variable "ssh_keys" {
  type        = list(any)
  description = "A list of SSH IDs or fingerprints to enable in the format [12345, 123456] that are added to manager nodes"
}

variable "vpc_uuid" {
  type        = string
  description = "The ID of the VPC where the Droplet will be located."
}

variable "tags" {
  description = "List of DigitalOcean tag ids"
  default     = []
  type        = list(any)
}
