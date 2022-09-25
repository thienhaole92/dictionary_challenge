resource "digitalocean_tag" "tag" {
  name = "${var.project_name}-${var.environment}-${var.name}"
}
