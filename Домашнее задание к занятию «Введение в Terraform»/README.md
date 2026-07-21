## Задача 0
terraform version
![alt text](<Задача 0/Screenshot 2026-07-19 194039.png>)

terraform init 
![
](<Задача 0/Screenshot 2026-07-19 194639.png>)


"type": "random_password",
      "name": "random_string",
Знаечение 1x705K3LW8nfBtUv

Ошибки в коде:
1. Блок рексурсов должен иметь тип и кастомное имя
2. Имя рескурса не может начинаться с цифры.
3. Указан неверный тип ресурса, правильный:  name  = "example_${random_password.random_string.result}"


ds@ds-netology:~/terraform-demo$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
156a506618ec   5a88c9c45479   "/docker-entrypoint.…"   22 seconds ago   Up 22 seconds   0.0.0.0:9090->80/tcp   example_1x705K3LW8nfBtUv



ds@ds-netology:~/terraform-demo$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
91c9d7acdd67   5a88c9c45479   "/docker-entrypoint.…"   4 seconds ago   Up 3 seconds   0.0.0.0:9090->80/tcp   hello_world


Опция -auto-approve выполняет действия без подтверждения пользователя. Это удобно в автоматизации, но несет риск удаления удаления ресурсов при ошибках в коде

Terraform не удаляет образ из-за опций провайдера   keep_locally = true
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
https://library.tf/providers/kreuzwerker/docker/latest/docs/resources/image