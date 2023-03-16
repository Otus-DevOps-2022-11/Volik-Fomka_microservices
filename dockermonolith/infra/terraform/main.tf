terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.87.0"
    }
  }
}
provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

variable "instance_count" {
  default = 2
}

resource "yandex_compute_instance" "instance" {
  count = var.instance_count
  name  = "reddit-app-${count.index}"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  connection {
    type        = "ssh"
    host        = yandex_compute_instance.app.network_interface[0].nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }

}
