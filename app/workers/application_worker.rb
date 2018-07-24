# frozen_string_literal: true

require 'sidekiq-scheduler'

class ApplicationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, unique: :until_executed, retry: false
end
