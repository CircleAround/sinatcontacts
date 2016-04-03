require 'sinatra'
require 'sinatra/reloader'

get '/' do
  now = Time.now
  "CurrentTime: #{now}"
end