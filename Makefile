.PHONY: build up down dev

build:
	docker compose build

up:
	docker compose up -d
	@echo "Available at http://localhost:9343"

down:
	docker compose down
