require 'rack/test'
require 'rspec'
require 'pry'

Dir[File.expand_path('lib/**/*.rb')].each { |file| require file }

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  # conf.expect_with :rspec do |expectations|
  # expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  # end

  # conf.mock_with :rspec do |mocks|
  # mocks.verify_partial_doubles = true
  # end

  # conf.shared_context_metadata_behavior = :apply_to_host_groups
end
