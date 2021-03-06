%w[rack json pry mustermann].each { |gem| require gem }

Dir[File.expand_path('lib/**/*.rb')].each { |file| require_relative file }

router = Router.new do
  get '/', to: :home
  get '/hello/:name', to: :hello
  post '/auth', to: :create_session
end

# run router.to_app
Rack::Handler::WEBrick.run router.to_app
