FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {'山田'}
    firstname             {'太郎'}
    katakana_lastname     {'ヤマダ'}
    katakana_firstname    {'タロウ'}
    birthday              {'2000.1.1'}
  end
end