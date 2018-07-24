FactoryBot.define do
  factory :user, aliases: [:admin] do
    email { generate(:email) }
    password '12345678'
  end
end
