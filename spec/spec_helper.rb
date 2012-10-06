require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'factory_girl'
  require 'capybara/rspec'
  require 'capybara/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.include Devise::TestHelpers, :type => :controller
    config.extend ControllerMacros, :type => :controller
  end

  shared_examples_for "invalid nil property" do |property|
    before { object.send "#{property}=", nil }
    it { expect { object.save }.to_not change(object.class, :count) }
  end
end

Spork.each_run do
  # reload all the models
  Dir["#{Rails.root}/app/models/**/*.rb"].each do |model|
    load model
  end

  # reload routes
  Template::Application.reload_routes!
end

# http://stackoverflow.com/a/3704992
RSpec::Matchers.define :be_boolean_or_nil do
  match do |actual|
    actual.nil? || (!!actual == actual)
  end
end
