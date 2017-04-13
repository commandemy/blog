require 'sinatra'
require 'sinatra/activerecord'
require './environments'

# Define the application with a name
class Blog < Sinatra::Application
end

class Article < ActiveRecord::Base

  def number_of_characters
    self.text.length
  end

end

class Comment

  def self.list
    [
      {comment: "Great site!", visitor: "Bob"},
      {comment: "Wow. What a great blog", visitor: "Lisa"},
      {comment: "Love the site :)", visitor: "Jeff"}
    ]
  end

end

# Our first route
get '/' do
  @articles = Article.order("created_at DESC")
  erb :"articles/index"
end

get '/about' do
  erb :"about/index"
end

get '/articles/new' do
  @article = Article.new
  erb :"articles/new"
end

post "/articles" do
  @article = Article.new(params[:article])
  if @article.save
    redirect "/"
  else
    erb :"articles/new"
  end
end

get "/articles/:id" do
  @article = Article.find(params[:id])
  erb :"articles/show"
end

get "/articles/:id/edit" do
  @article = Article.find(params[:id])
  erb :"articles/edit"
end

put "/articles/:id" do
  @article = Article.find(params[:id])
  if @article.update_attributes(params[:article])
    redirect "/"
  else
    erb :"articles/edit"
  end
end

delete "/articles/:id" do
  @article = Article.find(params[:id]).destroy
  redirect "/"
end

get '/guestbook' do
  @comments = Comment.list

  erb :"guestbook/index"
end

get '/api' do
  content_type :json

  @articles = Article.order("created_at DESC")
  @articles.to_json
end

