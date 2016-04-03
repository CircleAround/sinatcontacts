require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @now = Time.now
  erb :index
end