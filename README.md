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