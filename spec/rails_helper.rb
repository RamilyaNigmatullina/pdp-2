ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"
# require "webmock/webmock_helpers"
# require "capybara/webkit"

# include WebmockHelpers

Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

# Capybara.javascript_driver = :webkit

# ::Timezone::Lookup.lookup.default("America/Los_Angeles")
# ::Timezone::Lookup.lookup.stub(-10, 10, 'America/Los_Angeles')

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end

# Capybara::Webkit.configure do |config|
#   config.block_url("maps.googleapis.com")
# end
