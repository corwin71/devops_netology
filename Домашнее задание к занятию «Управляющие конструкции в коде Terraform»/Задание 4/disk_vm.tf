
resource "yandex_compute_disk" "data_disks" {
  count = 3
  name  = "data-disk-${count.index + 1}"
  size  = 1
  type  = "network-hdd" 
  zone  = "ru-central1-a" 
}

locals {
  disk_map = {
    for idx, disk in yandex_compute_disk.data_disks : disk.id => disk
  }
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"


  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      name     = "storage-boot-disk"
    }
  }

  dynamic "secondary_disk" {
    for_each = local.disk_map
    content {
      disk_id = secondary_disk.value.id
      mode      = "READ_WRITE" 
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.vms_metadata 
}

