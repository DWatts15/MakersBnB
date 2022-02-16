require 'sinatra/base'
require 'sinatra/reloader'

require_relative './lib/signup'
require 'pg'

class MakersBnB < Sinatra::Base
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

    if signup.logged_in_as != FALSE
      'logged in'
    else
      'Invalid login'
      erb :signup
    end
  end
























  get '/availability' do
    @properties = Property.all
    erb :'properties/index'
  end

run! if app_file == $0
end