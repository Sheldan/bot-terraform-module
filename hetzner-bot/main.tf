resource "hcloud_server" "bot_server" {
  name                  = "bot-instance-${var.project_name}"
  image                 = var.os_type
  server_type           = var.server_type
  location              = var.location
  user_data             = templatefile("${path.module}/resources/user-data.yaml", {
    user_name           = var.user_name,
    ssh_key             = data.hcloud_ssh_key.access-key.public_key
  })
  labels = {
    Name                = "bot-instance-${var.project_name}"
  }
}

resource "hcloud_volume" "bot_volume" {
  name                  = "bot-volume-${var.project_name}"
  size                  = var.disk_size
  format                = "xfs"
  server_id             = hcloud_server.bot_server.id
  automount             = true
  delete_protection     = true
  labels = {
    Name                = "docker-volume-${var.project_name}"
  }
}

resource "hcloud_network" "network" {
  name                  = var.network_name
  ip_range              = var.ip_range
  labels = {
    Name                = "network-${var.project_name}"
  }
}

resource "hcloud_network_subnet" "bot_private_subnet" {
  network_id            = hcloud_network.network.id
  type                  = var.network_type
  network_zone          = var.network_zone
  ip_range              = var.ip_range
}

resource "hcloud_server_network" "bot_network" {
  server_id             = hcloud_server.bot_server.id
  subnet_id             = hcloud_network_subnet.bot_private_subnet.id
}