source 'https://rubygems.org/'

gem "sinatra"
gem "activerecord"
gem "sinatra-activerecord"
gem "rake"

gem "cucumber-sinatra"
gem "rspec", "2.99.0"

group :development do
  gem "shotgun" # So we don't need to restart server everytime
  gem "tux" # Developer console
  gem 'sqlite3' # for local development
end

group :production do
  gem "mysql"
end
