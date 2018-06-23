
set :keep_releases, 1
set :branch, 'master'
set :deploy_to, '/home/deploy/api/staging'
set :rvm_type, :user

server '10.0.1.170',
  user: 'deploy',
  roles: %w{app db},
  ssh_options: {
    proxy: Net::SSH::Proxy::Command.new('ssh -W %h:%p master@52.45.51.234')
  }
