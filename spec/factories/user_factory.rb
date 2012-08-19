FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "abc123"
    name "Default"
    admin true
  end
end
