# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/puma'
require "whenever/capistrano"

install_plugin Capistrano::Puma

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
