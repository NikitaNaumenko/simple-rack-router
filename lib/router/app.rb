class Router
  class App
    attr_reader :resolver

    def initialize(resolver)
      @resolver = resolver
    end

    def call(env)
      route = [env['REQUEST_METHOD'], env['PATH_INFO']]

      body, status, headers = resolver.fetch(*route)
      Rack::Response.new(body, status, headers)
    end
  end
end
