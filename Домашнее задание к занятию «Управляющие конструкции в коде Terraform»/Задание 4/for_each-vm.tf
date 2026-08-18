# filepath: modules/vm/for_each-vm.tf

variable "each_vm" {
   type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    {
      vm_name     = "main-db"
      cpu         = 4
      ram         = 8
      disk_volume = 100
    },
    {
      vm_name     = "replica-db"
      cpu         = 2
      ram         = 4
      disk_volume = 50
    }
  ]
}

locals {
  db_vms_map = {
    for vm in var.each_vm : vm.vm_name => vm
  }
}

resource "yandex_compute_instance" "db_servers" {
  for_each = local.db_vms_map

  name        = each.value.vm_name
  platform_id = "standard-v3"
  zone        = "ru-central1-a" # Укажите актуальную зону
  

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
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

  metadata = var.vms_metadata 
}