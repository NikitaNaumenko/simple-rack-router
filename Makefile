app:
	docker-compose up
app-build:
	docker-compose build
app-bash:
	docker-compose run app bash
app-gems-install:
	docker-compose run app bundle install --standalone
