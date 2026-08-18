data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
}



resource "yandex_compute_instance" "web_instances" {
  count = 2

  name = "web-${count.index + 1}"

  resources {
    cores  = 2
    memory = 2
   }


  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  depends_on = [yandex_compute_instance.db_servers]

  metadata = var.vms_metadata 

}
