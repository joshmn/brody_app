# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { size: 30, url: ENV['REDIS_URL'] }
end

Sidekiq::Extensions.enable_delay!
