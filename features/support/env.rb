# Generated by cucumber-sinatra. (2015-04-28 15:35:33 +0200)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Blog

class BlogWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  BlogWorld.new
end

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation