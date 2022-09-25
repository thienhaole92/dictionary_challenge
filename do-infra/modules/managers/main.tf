resource "digitalocean_droplet" "manager" {
  count    = var.total_instances
  image    = var.image
  name     = format("%s-%s-%s-%02d-%s", var.project_name, var.environment, var.name, count.index + 1, var.region)
  region   = var.region
  size     = var.size
  vpc_uuid = var.vpc_uuid
  ssh_keys = var.ssh_keys
  tags     = var.tags
}

