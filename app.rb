# Gemを読み込む準備
require 'rubygems'
require 'bundler'
# Gemfileに入っているgemを全部require
Bundler.require

set :database, {adapter: "sqlite3", database: "contacts.sqlite3"}

class Contact < ActiveRecord::Base
  validates_presence_of :name
end

get '/' do
  @now = Time.now
  @contacts = Contact.all
  erb :index
end

get '/contact_new' do
  erb :contact_form
end

post '/contacts' do
  p params
  @name = params[:name]
  @contact = Contact.new(name: @name)
  @contact.save
  redirect '/'
end