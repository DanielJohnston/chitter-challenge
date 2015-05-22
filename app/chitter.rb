require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'data_mapper_setup'

require_relative 'controllers/users'


module Chitter

  class Application < Sinatra::Application
    enable :sessions
    set :session_secret, 'super secret'
    use Rack::Flash
    use Rack::MethodOverride # What does this do?

    use Routes::Users

    set :partial_template_engine, :erb
    set :views, Proc.new { File.join('app', 'views') }
    set :public_folder, Proc.new { File.join('public') }

  end

end
