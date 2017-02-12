require 'mina/git'
require 'mina/rails'

set :application_name, 'hendyanto.com'
set :domain, 'hendyanto.com'
set :deploy_to, '/var/www/hendyanto.com'
set :repository, 'git@github.com:hendyanto/hendyanto.com.git'
set :branch, 'master'

set :user, ENV['ssh_user']

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end
end
