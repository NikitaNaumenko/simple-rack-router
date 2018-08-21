# frozen_string_literal: true

class Router
  class Resolver
    HTTP_RESPONSES = {
      not_found: ['Not Found', '404', {}]
    }.freeze
    attr_accessor :routes

    def initialize
      @routes = {}
    end

    def push(verb, path, func)
      routes[verb] = [*routes[verb], matcher(path) => func]
    end

    def fetch(verb, path)
      request_params = match(verb, path)
      request_params ? response(request_params) : HTTP_RESPONSES[:not_found]
    end

    private

    def matcher(route)
      Mustermann.new(route, type: :rails)
    end

    def match(verb, path)
      method = methods(verb).find { |route| route.keys.first === path }

      return if method.nil?

      method.map { |k, v| [v, k.params(path)] }.flatten
    end

    def methods(verb)
      routes[verb]
    end

    def response(request_params)
      [Router::Endpoints.send(*request_params), '200', {}]
    end
  end
end
