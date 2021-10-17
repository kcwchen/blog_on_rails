FactoryBot.define do
  factory :post do
    title { Faker::Job.title }
    body { Faker::Lorem.paragraph }
  end
end
