require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Brody
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths << "#{Rails.root}/lib"

    unless Rails.env.development?
      require "#{Rails.root}/lib/cloudflare"
      config.middleware.insert_before(0, Rack::CloudFlareMiddleware)
    end
  end
end
