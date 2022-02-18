require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'

require_relative './lib/signup'
# pg = postgres
require 'pg'

# something about inheritance
class MakersBnB < Sinatra::Base
  # sessions stores a variable when defined once (like a cookie), to be used across the app
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  # the naming convention may need improving as this page represents both the sign up and login page
  get '/signup' do
    erb :signup
  end

  # params relates to the username and password entered into the form. These are then assigned to the @username and @password
  # variables. A new instance of the Signup class is created, and the @username and @password variables are passed as arguments
  # into the signup method of the Signup class.
  post '/signup' do
    @username = params[:username]
    @password = params[:password]
    signup = Signup.new
    signup.signup(@username, @password)

    erb :signup
  end

  # this route is a post request - this signifies that the requestor wishes to change or add new data to the server.
  # A new instance of the Signup class is instantiated. A Signup class is required separately for the /signup and /login routes.
  # Params are taken from the form, and assigned to the @username_login and @password_login variables.
  # The login method of the Signup class is called, with arguments of @username_login and @password_login
  post '/login' do

    signup = Signup.new

    @username_login = params[:username_login]
    @password_login = params[:password_login]

    signup.login(@username_login, @password_login)


    # User attempts to log in. If we found a match for the username and password in the database, a session is created
    # and the username is stored in session. Then we redirect to the '/properties' route.
    # Otherwise, if there was no match to the database, return 'Invalid login' and return to the sign up page.
    if signup.logged_in_as != false
      session[:username] = signup.logged_in_as
      redirect '/properties'
    else
      'Invalid login'
      erb :signup
    end
  end

  # lists all properties. This may work as the 'homepage' - index.html is considered the homepage and this may be a better route name
  # the session username is assigned to @username. 
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
    @property_id = session[:property_id]
    @dates = params[:date]
    reservation = Property.reserve(@dates, @property_id) #change 3 to property_id
    erb :'properties/pending'
  end
  run! if app_file == $0
end
