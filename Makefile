postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

mysql:
	docker run --name mysql8 -p 3306:3306  -e MYSQL_ROOT_PASSWORD=secret -d mysql:8

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root postgres

dropdb:
	docker exec -it postgres12 dropdb postgres

migrateup:
	migrate -path db/migration -database "postgresql://shashanks:secret@localhost:5432/postgres?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://shashanks:secret@localhost:5432/postgres?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server
postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

mysql:
	docker run --name mysql8 -p 3306:3306  -e MYSQL_ROOT_PASSWORD=secret -d mysql:8

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root postgres

dropdb:
	docker exec -it postgres12 dropdb postgres

migrateup:
	migrate -path db/migration -database "postgresql://shashanks:secret@localhost:5432/postgres?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://shashanks:secret@localhost:5432/postgres?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://shashanks:secret@localhost:5432/postgres?sslmode=disable" -verbose down


migratedown1:
	migrate -path db/migration -database "postgresql://shashanks:secret@localhost:5432/postgres?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock: 
	mockgen --destination db/mock/store.go  github.com/Shanky1199/go-bank-management/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server
