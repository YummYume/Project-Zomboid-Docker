COMPOSE=docker compose --env-file .env.local
EXEC=$(COMPOSE) exec zomboid-server

# Starting/stopping the server
start: build-no-cache up-recreate

restart: stop up-recreate

build:
	$(COMPOSE) build --force-rm

build-no-cache:
	$(COMPOSE) build --no-cache --force-rm

up:
	$(COMPOSE) up -d --remove-orphans

up-recreate:
	$(COMPOSE) up -d --remove-orphans --force-recreate

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

# SSH & Bash
ssh:
	$(EXEC) sh

bash:
	$(EXEC) bash

# Logs
logs:
	$(COMPOSE) logs zomboid-server
