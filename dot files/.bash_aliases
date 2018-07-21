#!/bin/bash

# functions / aliases for bash commands

################################################################
#### Docker Helper Functions ###################################
################################################################

docker_vm() {
        screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
}

docker_clean_containers() {
        sudo docker ps -aq --no-trunc |xargs docker rm
}

docker_clean_images() {
        sudo docker image ls -q |xargs docker rmi
}

docker_clean_volumes() {
        sudo docker volume ls -q |xargs docker volume rm
}

docker_clean_networks() {
        sudo docker network ls -q |xargs docker network rm
}

docker_clean_all() {
        sudo docker_clean_containers && \
        sudo docker_clean_images && \
        sudo docker_clean_volumes && \
        sudo docker_clean_networks
}
