###cloud vars

variable "ssh-key" {
  type        = string
  description = ""
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6VhawzPE8AKfaa2h/g18ZSuzfKUj1afhTtPfA+f9/5wVxlnW0lhP+JQcB7oKsum16DW/Hfr882kETULLQT/JIxTtUo+uuYNN5KQiuL64+s23oW3YEK5cgWxCMc4uaeNQlWG34FnjjynwB94V5pG8I2vSbZsPya6uGcSCdfaJ+Oj0xSaGfbZtODgZDsoMKqz8cFnSjHQVMzFWmiVb9Jh27f73kr0hhKFZB0iEdNlQDnSnQ9Ie91uZ1M7NlgE/etyTEkZH1pvpDyoAVk0Ke/Swi1nk+bys0PjnlErXo6tGuxSv5FyPv4ppX/6kn0+pfkKlrJ8S2H5C5knANk/lwqRFh"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1gafivc8kt0d7k9l7vs"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1g47rt3jub0nu5qbpbu"

}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}



variable "vms_metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
  })
}

