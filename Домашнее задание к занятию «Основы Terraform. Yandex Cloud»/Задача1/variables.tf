###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
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
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}


variable "vms_ssh_public_root_key" {
  type        = string
  default     = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5bUpBJWVv3O+/BM79tXxL1gqhHXc5pXxqHHbZw48fwT/Tc9cNepCtEwEkpfiYvgFYbIQqaq15sd+bGreOgtZHB3zkXstdz4actM1jl0qZKg4v9jz1y61YFXs7VrJtI5CITS6gCxHRw+cLAvnNQCl6ml9ArLxTqxCeAFhSzO5wkI6rnW1l8LrOhkxL19KrjkQAhL2ONY+WCrjU+kxBE3v9J11NFmZUAuc3QKLuZqexK8urXMWmP9+3Up1hynLZmSyWhCzsm7XbedkRSZwYbQ5lvZDL8QR1Kasl76DX2bcvla+Gfe3Tskc43W2qHqEUIcf6BZQlRX0Ko3eboztlHdNewIDAQAB"
  description = "DS ya key"
}