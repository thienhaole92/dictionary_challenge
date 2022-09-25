variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_droplet_ids" {
  description = "List of droplet ids"
  type        = list(string)
  default     = []
}

variable "cluster_tags" {
  description = "List of droplet tags"
  type        = list(string)
  default     = []
}
