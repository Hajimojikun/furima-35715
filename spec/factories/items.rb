FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    description  {Faker::Lorem.sentence}
    price {800}
    category_id  {2}
    state_id {2}
    who_pay_id  {2}
    prefecture_id  {2}
    due_day_id  {2}
    association :user

      after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
