FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    post { nil }
  end
end
