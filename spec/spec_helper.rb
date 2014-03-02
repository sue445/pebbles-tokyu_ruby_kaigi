require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pebbles/tokyu_ruby_kaigi'

require 'rspec'
require 'rspec/its'
require 'delorean'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Delorean

  config.after(:each) do
    back_to_the_present
  end
end
