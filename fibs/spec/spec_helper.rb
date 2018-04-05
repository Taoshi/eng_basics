require 'rubygems'
require 'simplecov'

SimpleCov.start('rails') do
  coverage_dir('public/coverage')
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'factory_girl'
require 'rspec/json_expectations'

Dir[Rails.root + 'spec/support/**/*.rb'].map(&method(:require))
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.mock_with :rspec
  config.order = :random
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before do
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
