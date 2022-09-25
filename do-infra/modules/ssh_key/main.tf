resource "digitalocean_ssh_key" "default" {
  name       = "${var.project_name}-${var.environment}-${var.name}-ssh-key"
  public_key = var.public_key
}
