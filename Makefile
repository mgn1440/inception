# Define the Docker Compose command
DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml

# Define the up target
up:
	$(DOCKER_COMPOSE) up -d --build

# Define the rebuild target
rebuild:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) up -d --build

# Define the clean target
clean:
	$(DOCKER_COMPOSE) down
	# docker rmi $$(docker images -q) -f
	docker volume rm $$(docker volume ls -q)
	rm -rf srcs/requirements/mariadb/data
	rm -rf srcs/requirements/wordpress/wordpress
	mkdir srcs/requirements/mariadb/data
	mkdir srcs/requirements/wordpress/wordpress