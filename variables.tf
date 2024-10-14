variable network_name {
  type        = string
  default     = "default_1"
  description = "VPC Network Name"
}

variable public_network {
  type = object({
    name        = string
    cidr_blocks = list(string)
    description = string
  })

  default     = {
    "name" = "public"
    "cidr_blocks" = ["192.168.10.0/24"]
    "description" = "public network"
  }
  description = "public Network"
}

variable private_network {
  type = object({
    name        = string
    cidr_blocks = list(string)
    description = string
  })

  default     = {
    "name" = "private"
    "cidr_blocks" = ["192.168.20.0/24"]
    "description" = "private network"
  }
  description = "private network"
}

variable nat_instance {
  type        = map
  default     = {
    "name" = "gateway"
    "ip" = "192.168.10.254"
    "image_id" = "fd80mrhj8fl2oe87o4e1"
    "cpu" = 2
    "memory" = 2
  }
  description = "NAT gw"
}

variable app {
  type        = map
  default     = {
    "image_id" = "fd8smb7fj0o91i68s15v"
    "cpu" = 2
    "memory" = 2
  }
  description = "vm config"
}

variable ssh_key {
  type        = string
  description = "ssh-key"
}
