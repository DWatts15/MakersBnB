require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'

require_relative './lib/signup'
require 'pg'

class MakersBnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @username = params[:username]
    @password = params[:password]
    signup = Signup.new
    signup.signup(@username, @password)

    erb :signup
  end

  post '/login' do

    signup = Signup.new

    @username_login = params[:username_login]
    @password_login = params[:password_login]

    signup.login(@username_login, @password_login)


    if signup.logged_in_as != false
      session[:username] = signup.logged_in_as
      redirect '/properties'
    else
      'Invalid login'
      erb :signup
    end
  end

  get '/properties' do
    @properties = Property.all
    erb :'properties/index'
  end

  get '/properties/new' do
    @username = session[:username]
    if @username.class == NilClass
      redirect '/signup'
    else
      erb :'properties/new'
    end
  end

  post '/properties' do
    Property.create(name: params[:name], price: params[:price], availability: params[:availability], description: params[:description])
    redirect '/properties'
  end

  run! if app_file == $0
end
