# frozen_string_literal: true

class Router
  class Endpoints
    class << self
      def home(_params)
        'Hello world'
      end

      def hello(params)
        "Hello #{params.to_json}"
      end
    end
  end
end
