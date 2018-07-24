# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  delegate :cache_key, to: :object
end
