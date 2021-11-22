FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    association(:post, factory: :post)
  end
end
