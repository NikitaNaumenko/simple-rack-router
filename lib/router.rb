class Router
  HTTP_METHODS = %w[GET POST HEAD PUT PATCH DELETE].freeze

  attr_accessor :resolver

  def initialize(&block)
    @resolver = Resolver.new
    instance_eval(&block) if block_given?
  end

  # Define get, post, head, put, patch, delete methods
  HTTP_METHODS.each do |verb|
    define_method(verb.downcase) do |path, **args|
      add_route(verb, path, args)
    end
  end

  def add_route(verb, path, **args)
    return unless args[:to]

    method_to_call = args[:to]
    resolver.push(verb, path, method_to_call)
  end

  def resolve(verb, path)
    resolver.fetch(verb, path)
  end

  def to_app
    App.new(resolver)
  end
end
