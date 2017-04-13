Transform /^(-?\d+)$/ do |number|
  number.to_i
end

Given(/^a user that wrote (\d+) articles$/) do |number_of_articles_string|
  User = Struct.new('User', :number_of_articles)
  @user = User.new(number_of_articles_string)
end

=begin
Given /^the following users$/ do |table|
  User = Struct.new('User', :name, :number_of_articles)

  # Convert all headers to lower case symbol
  table.map_headers! {|header| header.downcase.to_sym }

  # Convert all user strings to Users
  table.map_column!(:user) {|user| User.new(user) }

  # Convert all the digits in the articles column to an Integer
  table.map_column!(:articles) {|count| count.to_i }

  table.hashes.each do |row|
    row[:user].number_of_articles = row[:articles]
  end
end
=end

Transform /^table:user,articles$/ do |table|
  User = Struct.new('User', :name, :number_of_articles)

  table.map_headers! {|header| header.downcase.to_sym }
  table.map_column!(:user) {|user| User.new(user) }
  table.map_column!(:articles) {|count| count.to_i }
  table.hashes.each do |row|
    row[:user].number_of_articles = row[:articles]
    row.delete(:articles)
  end

  table
end

Given /^the following users$/ do |table|
  @table_hashes = table.hashes
  puts @table_hashes
end

Then(/^this user is a frequent writer$/) do
  expect(@user.number_of_articles.class).to eq(Fixnum)
  expect(@user.number_of_articles).to be > 9
end

Then(/^I expect the following users to exist$/)do
  @table_hashes.each do |row|
    expect(row[:user].name).to_not be_nil
    expect(row[:user].number_of_articles.class).to eq(Fixnum)
  end
end

=begin
Transform /^(-?\d+)$/ do |number|
  number.to_i
end

Given(/^a new user with age (\d+)$/) do |age_string|
  User = Struct.new("User", :age)
  @user = User.new(age_string)
end

Then(/^the user is valid$/) do
  expect(@user.age.class).to eq(Fixnum)
end
=end