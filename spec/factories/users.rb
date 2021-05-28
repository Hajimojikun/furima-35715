FactoryBot.define do 
  factory :user do
    name = Gimei.name
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length:6)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.name}
    last_name {name.last.kanji}
    first_name {name.first.kanji}
    last_name_kana {name.last.katakana}
    first_name_kana {name.first.katakana}
    birth_day {Faker::Date.birthday(min_age:18, max_age:60)}
  end
end
