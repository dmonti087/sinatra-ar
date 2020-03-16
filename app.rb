  require "sinatra"
  require "sinatra/reloader"
  require "sinatra/activerecord"
  set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/user'

get '/' do
  @users = User.all 
  erb :user_list
end

get '/new' do
  erb :user_form
end

get '/remove' do
  erb :user_delete
end

post "/create" do
  user = User.new
  user.email = params[:email]
  user.name = params[:name]
  user.save
  "New User and Email saved as follows: Name: #{params[:name]}, Email: #{params[:email]}"
end

post '/delete' do
 user = User.find_by(name: params[:name])
  if !user.nil? 
  user.destroy
  "User #{params[:name]} deleted"
  else
   "User Not Found"
  end
end 
