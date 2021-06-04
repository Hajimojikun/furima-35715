FactoryBot.define do
  factory :buy_item_where_to do
    address = Gimei.address

    number                {4242424242424242}
    exp_month             {3}
    exp_year              {23}
    cvc                   {123}
    post_code             {123-1234}
    city                  {address.city.kanji}
    street                {address.town.kanji}
    name_of_the_building  {address.kanji}
    phone_number          {Faker::Number.number(digits: 11)}
    prefecture_id         {2}

    association :user
    association :item
  end
end