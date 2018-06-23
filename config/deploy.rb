# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "renty"
set :repo_url, "git@github.com:Jonas-Args/rails5-template.git"

set :bundle_without, [:development, :test]

set :rvm_ruby_version, '2.4.1@renty'
set :rails_env, 'production'

set :linked_files, %w{config/database.yml config/application.yml config/secrets.yml}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
