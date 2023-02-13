#! /bin/bash

echo "Setting Rails 7 with Ruby 3.1.2"
echo "----------------------------"
echo "update Gemfile"
rm -rf ./Gemfile
cp $HOME/railsBoot/arq/Gemfile Gemfile
sleep 3s

echo "add Rubocup and env file"
cp $HOME/railsBoot/arq/.rubocop.yml .rubocop.yml
cp $HOME/railsBoot/arq/.env .env
cp $HOME/railsBoot/arq/.env.test .env.test
sleep 3s

echo "add generate file"
cp $HOME/railsBoot/arq/generate.rb config/initializers/generate.rb
sleep 3s

echo "add favicon icon"
cp $HOME/railsBoot/arq/favicon.png app/assets/images/favicon.png
sleep 3s

echo "update file application.html.slim"
rm -rf ./app/views/layouts/application.html.erb
cp  $HOME/railsBoot/arq/application.html.slim app/views/layouts/application.html.slim
sleep 3s

echo "bundle install and setting rspec"
bundle install
rails g rspec:install
rails g simple_form:install
rails g heroicon:install
sleep 3s

echo "add github actions"
cp $HOME/railsBoot/arq/.github ./ -r
cp $HOME/railsBoot/arq/heroicon.rb config/initializers/heroicon.rb

echo "update tailwind.config.js"
rm -rf ./config/tailwind.config.js
cp $HOME/railsBoot/arq/tailwind.config.js config/tailwind.config.js
sleep 3s

echo "update rspec files"
rm -rf ./spec/rails_helper.rb
mkdir ./spec/support
cp $HOME/railsBoot/arq/rails_helper.rb ./spec/rails_helper.rb
cp $HOME/railsBoot/arq/request_spec_helper.rb ./spec/support/request_spec_helper.rb
cp $HOME/railsBoot/arq/request_spec_helper.rb ./spec/support/database_cleaner.rb
sleep 3s

echo "Initial commit and add git flow"
git add .
git commit -m "Initial commit"
git flow init -d

echo 'Update rails version with successful'



