# Install
1. Gemfile
```
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', '~> 6'
gem 'active_record_migrations'
gem 'mysql2'
gem 'rails-observers'
```
1. config ruby : 2.6.5 (pas 2.7)
1. bundle install
1. db/config.yml.example
```
development:
  adapter:  mysql2
  host:     localhost
  username: root
  password: Pa$$w0rd
  database: poo_ecommerce
```
1. Copier db/config.yml.example dans db/config.yml, et adaptewr les valeurs