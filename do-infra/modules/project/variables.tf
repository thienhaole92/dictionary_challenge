variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = "A project to represent development resources."
}

variable "purpose" {
  type    = string
  default = "Web Application"
}

variable "environment" {
  type    = string
  default = "Development"
}
