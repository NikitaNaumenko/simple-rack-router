# frozen_string_literal: true

class Router
  class Endpoints
    class << self
      def home(_params)
        'Hello world'
      end

      def hello(params)
        binding.pry
        "Hello #{params}"
      end
    end
  end
end
