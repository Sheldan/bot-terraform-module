output "instance_ipv4" {
  description     = "IPv4 address of the instance"
  value           = hcloud_server.bot_server.ipv4_address
}