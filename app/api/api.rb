# frozen_string_literal: true

class API < Grape::API
  format :json
  prefix :api
  version 'v1', using: :path

  default_format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  mount V1::Users

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_response(message: e.message, status: 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_response(message: e.message, status: 422)
  end
end
