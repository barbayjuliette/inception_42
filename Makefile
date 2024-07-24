CYAN = \001\033[1;36m\002
GREEN = \001\033[1;32m\002
RED = \001\033[1;31m\002
RESET = \001\033[0m\002

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml
WP_DATA = ${HOME}/data/wordpress
DB_DATA = ${HOME}/data/mariadb
RM = rm -rf

up:
	@echo "$(RED)-->$(CYAN) Creating and directories and containers $(RESET)"
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d
	@echo "$(RED)-->$(CYAN) Containers ready $(RESET)"

# Stop the containers without removing them
stop:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) stop

# Restart the containers
start:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) start

# Stop and remove the containers
down:
	@echo "$(RED)-->$(CYAN) Stopping and removing the containers $(RESET)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

# Delete containers with data
clean: stop
	@echo "$(RED)-->$(CYAN) Deleting the containers with all data $(RESET)"
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -a -q) || true
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --volumes || true
	@docker network rm inception || true
	@$(RM) $(WP_DATA) || true
	@$(RM) $(DB_DATA) || true
	@echo "$(RED)-->$(CYAN) All clean $(RESET)"

logs:
	@for container in $$(docker ps -q); do \
		name=$$(docker inspect --format '{{.Name}}' $${container} | sed 's/\///'); \
		echo "$(RED)-->$(CYAN)Logs for container $${name}:$(RESET)"; \
		logs=$$(docker logs $${container} 2>&1); \
		if [ -z "$$logs" ]; then \
			echo "No logs for container $${name}"; \
		else \
			echo "$$logs"; \
		fi; \
		echo "$(RED)END$(RESET)"; \
	done

re: clean up

.PHONY: all clean re up stop start down logs