require 'rack'
require 'json'
require 'pry'
require 'mustermann'

require_relative 'lib/router'
require_relative 'lib/router/endpoints'
require_relative 'lib/router/resolver'
require_relative 'lib/router/app'

router = Router.new do
  get '/', to: :home
  get '/hello/:name', to: :hello
  post '/auth', to: :create_session
end

# run router.to_app
Rack::Handler::WEBrick.run router.to_app
