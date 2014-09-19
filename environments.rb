configure :development do
 set :database, {adapter: "sqlite3", database: "blog_dev.sqlite3"}
 set :show_exceptions, true
end

configure :test do
  set :database, {adapter: "sqlite3", database: "blog_test.sqlite3"}
  set :show_exceptions, true
end
