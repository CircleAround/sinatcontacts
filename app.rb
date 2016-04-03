require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @now = Time.now
  erb :index
end

get '/contact_new' do
  erb :contact_form
end

post '/contacts' do
  p params
  @name = params[:name]
  redirect '/'
end