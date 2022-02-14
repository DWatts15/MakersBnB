require 'sinatra/base'
require 'sinatra/reloader'

class XYZ < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/test' do
    'testing how branching works'
  end

run! if app_file == $0
end