output "ipv4_addresses" {
  value       = digitalocean_droplet.manager.*.ipv4_address
  description = "The manager nodes public ipv4 adresses"
}

output "ipv4_addresses_private" {
  value       = digitalocean_droplet.manager.*.ipv4_address_private
  description = "The manager nodes private ipv4 adresses"
}

output "droplet_ids" {
  value       = digitalocean_droplet.manager.*.id
  description = "The droplet ids"
}

output "droplet_hostnames" {
  value       = digitalocean_droplet.manager.*.name
  description = "The droplet names"
}