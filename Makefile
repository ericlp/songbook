include backend/.env

.PHONY: mock clear-db clean reset new-migration run-migrations

SONGBOOK_DB_URL = 'postgres://$(db_user):$(db_password)@localhost:5432/$(db_name)?sslmode=disable'
MIGRATION_PATH = 'backend/internal/db/migrations'
SONGBOOK_DB_DOCKER_NAME = 'songbook-db-1'

GAMMA_DB_DOCKER_NAME = 'songbook-gamma-db-1'
GAMMA_DB_USER= 'gamma'
GAMMA_DB_NAME= 'gamma'

mock: mock_data/mockUser.sql mock_data/dump.sql
	docker exec -i $(SONGBOOK_DB_DOCKER_NAME) psql -U $(db_user) $(db_name) < mock_data/dump.sql
	docker exec -i $(SONGBOOK_DB_DOCKER_NAME) psql -U $(db_user) $(db_name) < mock_data/mockUser.sql

clear-db:
	echo 'DROP SCHEMA public CASCADE; CREATE SCHEMA public' | docker exec -i $(SONGBOOK_DB_DOCKER_NAME) psql -U $(db_user) $(db_name)

clean: clear-db

new-migration:
	migrate -database ${SONGBOOK_DB_URL} -path $(MIGRATION_PATH) create -ext sql -dir $(MIGRATION_PATH) $(mig_name_arg)

run-migrations:
	migrate -database $(SONGBOOK_DB_URL) -path $(MIGRATION_PATH) up

setup-gamma-client:
	docker exec -i $(GAMMA_DB_DOCKER_NAME) psql -U $(GAMMA_DB_USER) $(GAMMA_DB_NAME) < mock_data/gammaClient.sql
	
reset-setup-db:
	make clean
	make mock
	make setup-gamma-client

db-dump:
	docker exec -i $(SONGBOOK_DB_DOCKER_NAME) pg_dump -U $(db_user) $(db_name) > mock_data/dump.sql

