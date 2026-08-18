
locals {
  web_data = [
    for instance in yandex_compute_instance.web_instances : {
      name   = instance.name
      nat_ip = instance.network_interface[0].nat_ip_address
      fqdn   = instance.fqdn
    }
  ]

  db_data = [
    for instance in yandex_compute_instance.db_servers : {
      name   = instance.name
      nat_ip = instance.network_interface[0].nat_ip_address
      fqdn   = instance.fqdn
    }
  ]


 storage_data = [
    {
      name   = yandex_compute_instance.storage.name
      nat_ip = yandex_compute_instance.storage.network_interface[0].ip_address
      fqdn   = yandex_compute_instance.storage.fqdn
    }
  ]
}
resource "local_file" "ansible_inventory" {
  filename = "./inventory_test"
  
  content = templatefile("${path.module}/inventory.tftpl", {
    webservers = local.web_data
    databases  = local.db_data
    storage    = local.storage_data
  })
}