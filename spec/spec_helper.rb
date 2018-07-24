# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
ENV['IN_MEMORY_APPLICATION_SETTINGS'] = 'true'

require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'rspec/retry'
require 'rspec-parameterized'

Dir[Rails.root.join('spec/support/helpers/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/shared_contexts/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/shared_examples/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures  = false

  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.infer_spec_type_from_file_location!

  config.define_derived_metadata(file_path: %r{/spec/}) do |metadata|
    location = metadata[:location]

    metadata[:api] = true if location =~ %r{/spec/requests/api/}

    # do not overwrite type if it's already set
    next if metadata.key?(:type)

    match = location.match(%r{/spec/([^/]+)/})
    metadata[:type] = match[1].singularize.to_sym if match
  end

  config.before(:suite) do
    Timecop.safe_mode = true
  end

  config.after(:all) do
  end
end

RSpec::Matchers.define :match_asset_path do |expected|
  match do |actual|
    path = Regexp.escape(expected)
    extname = Regexp.escape(File.extname(expected))
    digest_regex = Regexp.new(path.sub(extname, "(?:-\\h+)?#{extname}") << '$')
    digest_regex =~ actual
  end

  failure_message do |actual|
    "expected that #{actual} would include an asset path for #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not include an asset path for  #{expected}"
  end
end

FactoryBot::SyntaxRunner.class_eval do
  include RSpec::Mocks::ExampleMethods
end

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
