resource "digitalocean_vpc" "vpc" {
  ip_range = var.ip_range
  name     = "${var.project_name}-${var.environment}-vpc"
  region   = var.region
}
