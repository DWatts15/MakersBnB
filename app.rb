require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/login' do
    erb :login_index
  end

  post '/login' do
    @username = params[:username]
    @password = params[:password]

    erb :login_index
  end























  get '/properties' do
    @properties = Property.all
    erb :'properties/index'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  post '/properties' do
    Property.create(name: params[:name], price: params[:price], availability: params[:availability], description: params[:description])
    redirect '/properties'
  end

  run! if app_file == $0
end