terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.89.0"
    }
  }
}
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kubernetes_cluster" "k8s-cluster" {
  name                     = "k8s-dev"
  network_id               = var.network_id
  service_account_id       = var.service_account_id
  node_service_account_id  = var.node_service_account_id

  master {
    version = "1.21"
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
    public_ip = true
  }

  release_channel         = "RAPID"
  network_policy_provider = "CALICO"
}

resource "yandex_kubernetes_node_group" "k8s-node" {
  cluster_id = yandex_kubernetes_cluster.k8s-cluster.id
  version    = "1.21"
  name = "k8s-node"

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat                = true
      subnet_ids         = [var.subnet_id]
    }

    resources {
      cores  = var.cores
      memory = var.memory
    }

    boot_disk {
      type = "network-ssd"
      size = var.disk
    }

    metadata = {
      ssh-keys = "ubuntu:${file(var.public_key_path)}"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.node_count
    }
  }
}
