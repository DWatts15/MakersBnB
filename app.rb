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























  get '/availability' do
    @properties = Property.all
    erb :'properties/index'
  end

run! if app_file == $0
end