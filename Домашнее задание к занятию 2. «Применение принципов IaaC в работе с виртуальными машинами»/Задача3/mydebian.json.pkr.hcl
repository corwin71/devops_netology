
source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  disk_size_gb       = 20
  folder_id           = "b1gerrinqqup1nenc9ak"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e9bs1s6erhv652tihr5n"
#yc iam create-token
  token               = "token"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}


build {
  sources = ["source.yandex.debian_docker"]
 
 # 0. Hello
 provisioner "shell" {
    inline = ["echo 'hello from DS packer'"]
}  


 # 1. apt update
  provisioner "shell" {
    inline = [
      "sudo apt update",   
      "echo 'apt update'", 
    ]
  }

 # 2. Установка htop  tmux
  provisioner "shell" {
    inline = [
      "echo 'Install htop...'",
      "sudo apt-get install -y htop tmux",
      "echo 'htop tmux INSTALLED.'",
    ]
  }
}