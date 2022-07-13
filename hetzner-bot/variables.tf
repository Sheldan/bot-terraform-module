variable "hcloud_token" {
  sensitive   = true
}

variable "ssh_key_key" {
  type        = string
}

variable "project_name" {
  type        = string
}

variable "user_name" {
  type        = string
  default     = "bot"
}

variable "location" {
  default     = "nbg1"
  type        = string
}

variable "server_type" {
  default     = "cpx11"
  type        = string
}

variable "os_type" {
  default     = "ubuntu-20.04"
  type        = string
}

variable "disk_size" {
  default     = "10"
  type        = string
}

variable "ip_range" {
  default     = "10.0.1.0/24"
  type        = string
}

variable "network_name" {
  type        = string
  default     = "bot-network"
}

variable "network_zone" {
  type        = string
  default     = "eu-central"
}

variable "network_type" {
  type        = string
  default     = "cloud"
}

