# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Local Development

```sh
docker-compose up --build
```

```sh
docker-compose run web rake db:create
docker-compose run web rake db:migrate
```

```sh
docker-compose run web rails generate controller welcome
```

```sh
docker-compose run web bundle exec rails webpacker:install
docker-compose run web bundle exec rails webpacker:install:react
```

## Pushing to Heroku

```sh
heroku create
git push heroku master
heroku run rake db:migrate
heroku ps:scale web=1
heroku ps
heroku open
heroku logs
heroku logs --tail
heroku run rails console
heroku local
```

```sh
heroku stack:set container
git push heroku master
```

## Using Travis to Automate

