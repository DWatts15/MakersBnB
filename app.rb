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

    @username_sign_in = params[:username_sign_in]
    @password_sign_in = params[:password_sign_in]

    erb :signup
  end




  get '/availability' do

  end

run! if app_file == $0
end