# README

Simple CRUD (Create, Read, Update, Delete) API built with Ruby on Rails.

Heroku demo url (Backend):  https://rails-api-only.herokuapp.com/v1/macros

Firebase demo url (Frontend): https://reactjs-rails-crud-app.firebaseapp.com/

## Ruby version
ruby 2.6.1p33

## Rails version
Rails 5.2.3 


# INSTALLATION GUIDE

## Clone Project 

```CLI
git clone https://github.com/cloud-github/rails_api_only.git
```

## Bundle install

```CLI
bundle install
```

## Database creation
Open config/database.yml file.

Edit with your database name and credentials

```CLI
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  encoding: unicode
  username: your_username
  password: your_password
  host: localhost
  timeout: 5000

development:
  <<: *default
  #database: db/development.sqlite3
  database: your_database_name
```

## Database migration

```CLI
rails db:migrate
```

## Run Server
```CLI
rails s -p 3001        # If you like to run in port 3001. You can change this.
```

That's all.
You configured rails server successfully. 


## Deployment
