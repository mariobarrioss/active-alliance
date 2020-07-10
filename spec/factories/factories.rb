require 'faker'

FactoryBot.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.first_name }
    username { "@#{name}" }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end
