bundle check || bundle install
yarn install
rm -f /desafio-back-end/tmp/pids/server.pid
rake db:create db:migrate
bundle exec puma -C config/puma.rb
