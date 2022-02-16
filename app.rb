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

    @username_login = params[:username_login]
    @password_login = params[:password_login]

    signup.login(@username_login, @password_login)

    erb :signup
  end




  get '/availability' do

  end

run! if app_file == $0
end