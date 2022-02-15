require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/login' do

  end

  get '/availability' do
    property = [
      "Property1 - £50 - Available - Good Location",
      "Property2 - £60 - Available - Bad Location"
    ]

    property.join
  end

run! if app_file == $0
end