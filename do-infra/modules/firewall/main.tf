resource "digitalocean_firewall" "swarm-mode-internal-fw" {
  name        = "${var.project_name}-${var.environment}-internal-fw"
  droplet_ids = var.cluster_droplet_ids
  tags        = var.cluster_tags

  outbound_rule {
    protocol                = "tcp"
    port_range              = "2377"
    destination_tags        = var.cluster_tags
    destination_droplet_ids = var.cluster_droplet_ids
  }

  outbound_rule {
    # for container network discovery
    protocol                = "tcp"
    port_range              = "7946"
    destination_tags        = var.cluster_tags
    destination_droplet_ids = var.cluster_droplet_ids
  }

  outbound_rule {
    # UDP for the container overlay network.
    protocol                = "udp"
    port_range              = "4789"
    destination_tags        = var.cluster_tags
    destination_droplet_ids = var.cluster_droplet_ids
  }

  outbound_rule {
    # for container network discovery.
    protocol                = "udp"
    port_range              = "7946"
    destination_tags        = var.cluster_tags
    destination_droplet_ids = var.cluster_droplet_ids
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "51820"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }


  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol           = "tcp"
    port_range         = "2377"
    source_tags        = var.cluster_tags
    source_droplet_ids = var.cluster_droplet_ids
  }

  inbound_rule {
    # for container network discovery
    protocol           = "tcp"
    port_range         = "7946"
    source_tags        = var.cluster_tags
    source_droplet_ids = var.cluster_droplet_ids
  }

  inbound_rule {
    # UDP for the container overlay network.
    protocol           = "udp"
    port_range         = "4789"
    source_tags        = var.cluster_tags
    source_droplet_ids = var.cluster_droplet_ids
  }
  inbound_rule {
    # for container network discovery.
    protocol           = "udp"
    port_range         = "7946"
    source_tags        = var.cluster_tags
    source_droplet_ids = var.cluster_droplet_ids
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    # for wireguard network discovery.
    protocol         = "udp"
    port_range       = "51820"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}
