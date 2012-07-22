FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "abc123"
  end
end
