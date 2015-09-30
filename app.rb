require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Blog < Sinatra::Application
end

class Article < ActiveRecord::Base
  def number_of_characters
    self.text.length
  end
end

get '/' do
  @articles = Article.order("created_at DESC")
  erb :"articles/index"
end

get '/about' do
  erb :"about/index"
end

# The New Article form sends a POST request (storing data) here
# where we try to create the article it sent in its params hash.
# If successful, redirect to that article. Otherwise, render the "posts/new"
# template where the @article object will have the incomplete data that the
# user can modify and resubmit.
post "/articles" do
  @article = Article.new(params[:article])
  if @article.save
    redirect "/"
  else
    erb :"articles/new"
  end
end

# Get the New Article form
get '/articles/new' do
  @article = Article.new
  erb :"articles/new"
end

# Get the individual page of the article with this ID.
get "/articles/:id" do
  @article = Article.find(params[:id])
  erb :"articles/show"
end

# Get the Edit Article form of the article with this ID.
get "/articles/:id/edit" do
  @article = Article.find(params[:id])
  erb :"articles/edit"
end

# The Edit Article form sends a PUT request (modifying data) here.
# If the article is updated successfully, redirect to it. Otherwise,
# render the edit form again with the failed @article object still in memory
# so they can retry.
put "/articles/:id" do
  @article = Article.find(params[:id])
  if @article.update_attributes(params[:article])
    redirect "/"
  else
    erb :"articles/edit"
  end
end

# Deletes the article with this ID and redirects to homepage.
delete "/articles/:id" do
  @article = Article.find(params[:id]).destroy
  redirect "/"
end
