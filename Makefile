# Define the Docker Compose command
DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml

# Define the up target
up:
	$(DOCKER_COMPOSE) up -d

# Define the rebuild target
rebuild:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) build --no-cache
	$(DOCKER_COMPOSE) up -d

# Define the clean target
clean:
	$(DOCKER_COMPOSE) down
	docker rmi $(docker images -q) -f
