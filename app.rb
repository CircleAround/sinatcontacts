# Gemを読み込む準備
require 'rubygems'
require 'bundler'
# Gemfileに入っているgemを全部require
Bundler.require

set :database, {adapter: "sqlite3", database: "contacts.sqlite3"}
enable :sessions

class Contact < ActiveRecord::Base
  validates_presence_of :name
end

get '/' do
  @now = Time.now
  @contacts = Contact.all
  @message = session.delete :message
  # @message = session[:message] # これだと一回出てたものがずっと消えなくなる
  erb :index
end

get '/contact_new' do
  @contact = Contact.new
  erb :contact_form
end

post '/contacts' do
  p params
  name = params[:name]
  @contact = Contact.new(name: name)
  if @contact.save
    session[:message] = "#{name}さんを作成しました"
    redirect '/'
  else
    erb :contact_form
  end
end