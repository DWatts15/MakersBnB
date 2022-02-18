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


    #attempt login
    if signup.logged_in_as != false
      session[:username] = signup.logged_in_as
      redirect '/properties'
    else
      'Invalid login'
      erb :signup
    end
  end

  #list all properties
  get '/properties' do
     @username = session[:username] #ADDED THIS IN TOO

    @properties = Property.all
    erb :'properties/index'
  end

  #redirect to page depending on logged in or not
  get '/properties/new' do
    @username = session[:username]
    if @username.class == NilClass
      redirect '/signup'
    else
      erb :'properties/new'
    end
  end

  #create new property
  post '/properties' do
    puts 'a'
    Property.create(name: params[:name], price: params[:price], availability: params[:availability], description: params[:description], username: params[:username])
    redirect '/properties'
  end

  post '/get_property_id' do
    session[:property_id] = params[:property_id]
    p "get_property_id"
    redirect ('/properties/reservation')
  end

  #show individual property from database
  get '/properties/reservation' do
    p "reservation"
    @property_id = session[:property_id]
    @username = session[:username]
    @properties = Property.individual(@property_id)
    erb :'properties/reservation'
  end

  #add reservation to database
  post '/properties/pending' do
    @dates = params[:date]
    reservation = Property.reserve(@dates, 11) #change 3 to property_id
    erb :'properties/pending'
  end

  run! if app_file == $0
end
