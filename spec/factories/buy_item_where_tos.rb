FactoryBot.define do
  factory :buy_item_where_to do
    address = Gimei.address

    token                 {"tok_abcdefghijk00000000000000000"}
    post_code             {"123-1234"}
    city                  {address.city.kanji}
    street                {address.town.kanji}
    name_of_the_building  {address.kanji}
    phone_number          {Faker::Number.number(digits: 11)}
    prefecture_id         {2}
  end
end