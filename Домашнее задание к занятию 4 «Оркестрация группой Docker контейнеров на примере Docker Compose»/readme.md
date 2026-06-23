## Задача 1
https://hub.docker.com/repository/docker/corwin71/custom-nginx/general

## Задача 2

![alt text](image-1.png)
## Задача 3

sudo docker attach 0f7cfb25e904
Ctrl+C отправляет сигнал SIGINT, который прерывает работу контейнера


![alt text](image.png)
![alt text](image-2.png)
![alt text](image-3.png)
![alt text](image-4.png)

## Задача 4
![alt text](image-5.png)

compose.yaml

version: "3"
include:
- docker-compose.yaml
services:
  portainer:
    network_mode: host
    image: portainer/portainer-ce:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock



Запустился контейнер  task-portainer-1, т.к у Compose предпочтительный compose.yaml. Остальные файлы оставлены для совместимости


![alt text](image-6.png)
![alt text](image-7.png)
![alt text](image-8.png)
![alt text](image-9.png)
![alt text](image-10.png)
![alt text](image-11.png)

