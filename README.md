# Bootcamp Week 5: Rails Model

This project is a small Rails app used to practice models, and database setup. Follow the steps below to get the app running locally.

## Prerequisites

You need these installed before you start:

- Ruby ruby-3.4.4
- Bundler (`gem install bundler`)
- PostgreSQL

## 1) Clone the repo from GitHub

1. Go to the GitHub repo page for this project.
2. Click **Code** and copy the SSH URL.
3. Clone to your machine:

```
git clone git@github.com:prepsaKayastha/w5-rails-model.git
cd w5-rails-model
```

## 2) Install dependencies

From the terminal:

```
bundle install
```

## 3) Configure the database

This app uses PostgreSQL. The default database names are in `config/database.yml`.

## 4) Create and migrate the database

```
bin/rails db:create
bin/rails db:migrate
```

## 5) Seed sample data

```
bin/rails db:seed
```

This loads a few sample products so the UI is not empty.

## 6) Run the server

```
bin/dev
```

Open your browser to:

```
http://localhost:3000
```

You should see the products list page.

## Project structure (quick tour)

- `app/models` holds Active Record models
- `app/controllers` handles requests and loads data
- `app/views` renders HTML templates
- `db/migrate` contains database migrations
- `db/seeds.rb` provides sample data

## Learning goals

By working in this project, you will practice:

- Creating a model + migration
- Validating data in Rails
- Associations
- Model callbacks and scopes
