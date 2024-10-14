resource "yandex_compute_instance" "nat" {
  name        = var.nat_instance.name

  resources {
    cores  = var.nat_instance.cpu
    memory = var.nat_instance.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_instance.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = var.nat_instance.ip
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
  allow_stopping_for_update = true
}

resource "yandex_compute_instance" "public_app" {
  name        = "public-app"

  resources {
    cores  = var.app.cpu
    memory = var.app.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.app.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}

resource "yandex_compute_instance" "private_app" {
  name        = "private-app"

  resources {
    cores  = var.app.cpu
    memory = var.app.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.app.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}
