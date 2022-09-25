variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "ip_range" {
  type        = string
  description = "The range of IP addresses for the VPC in CIDR notation."
  default     = "10.10.10.0/24"
}

variable "region" {
  type        = string
  description = "The DigitalOcean region slug for the VPC's location."
  default     = "sgp1"
}
