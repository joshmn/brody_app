# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.org" }
end
