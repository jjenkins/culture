up: ; $(info $(M) Starting development environment...)
	docker-compose up -d --build

down: ; $(info $(M) Shutting down development environment...)
	docker-compose down

psql: ; $(info $(M) Connecting to postgres console...)
	psql $(DATABASE_URL)

migrate: ; $(info $(M) Migrating database...)
	migrate -path ./db/migrations -database $(DATABASE_URL) up

rollback: ; $(info $(M) Reverting last migration...)
	migrate -path ./db/migrations -database $(DATABASE_URL) down 1

test: ; $(info $(M) Running test suite...)
	richgo test -v -race -covermode atomic -bench=. -benchmem -timeout 20m ./...
