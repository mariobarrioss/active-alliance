require 'faker'

FactoryBot.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.first_name }
    username { "@#{name}" }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end

FactoryBot.define do
  factory :group do
    user
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(word_count: 2) }

    trait :with_uploaded_icon do
      icon { Rack::Test::UploadedFile.new('spec/support/assets/test-image.jpg', 'image/jpg') }
    end
  end
end

FactoryBot.define do
  factory :activity do
    author
    description { Faker::Lorem.word }
    amount { Faker::Number.number(digits: 2) }
  end
end
