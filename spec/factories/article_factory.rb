FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.words(4).join(" ").titleize }
    body { Faker::Lorem.paragraphs(3).join("\n") }
  end

  trait :featured do
    featured { true }
  end
end
