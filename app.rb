# Gemを読み込む準備
require 'rubygems'
require 'bundler'
# Gemfileに入っているgemを全部require
Bundler.require

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