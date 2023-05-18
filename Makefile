.PHONY: setup bash-db bash-web

# Define os nomes dos containers
DB_CONTAINER = joinville-doa-backend-db-1
WEB_CONTAINER = joinville-doa-backend-web-1

# Comandos
setup:
	sudo docker compose build
	sudo docker compose run --rm web rails db:create db:migrate db:seed

bash-db:
	sudo docker exec -it $(DB_CONTAINER) bash

bash-web:
	sudo docker exec -it $(WEB_CONTAINER) bash

# Comandos do docker-compose
up:
	sudo docker compose up

down:
	sudo docker compose down

restart:
	sudo docker compose restart
