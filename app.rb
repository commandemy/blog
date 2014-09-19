require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Blog < Sinatra::Application
end

class Post < ActiveRecord::Base

  def number_of_characters
    self.text.length
  end

end

get '/' do
  @posts = Post.order("created_at DESC")
  erb :"posts/index"
end

get '/about' do
  erb :"about/index"
end

# The New Post form sends a POST request (storing data) here
# where we try to create the post it sent in its params hash.
# If successful, redirect to that post. Otherwise, render the "posts/new"
# template where the @post object will have the incomplete data that the
# user can modify and resubmit.
post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "/"
  else
    erb :"posts/new"
  end
end

# Get the New Post form
get '/posts/new' do
  @post = Post.new
  erb :"posts/new"
end

# Get the individual page of the post with this ID.
get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :"posts/show"
end

# Get the Edit Post form of the post with this ID.
get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  erb :"posts/edit"
end

# The Edit Post form sends a PUT request (modifying data) here.
# If the post is updated successfully, redirect to it. Otherwise,
# render the edit form again with the failed @post object still in memory
# so they can retry.
put "/posts/:id" do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect "/"
  else
    erb :"posts/edit"
  end
end

# Deletes the post with this ID and redirects to homepage.
delete "/posts/:id" do
  @post = Post.find(params[:id]).destroy
  redirect "/"
end
