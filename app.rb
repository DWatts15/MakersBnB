require 'sinatra/base'
require 'sinatra/reloader'

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
    name = params['name']
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name) VALUES('#{name}')")
    redirect '/properties'
  end

  run! if app_file == $0
end