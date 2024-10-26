FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a000000'}
    password_confirmation {password}
    lastname              {'山田'}
    firstname             {'太郎'}
    katakana_lastname     {'ヤマダ'}
    katakana_firstname    {'タロウ'}
    birthday              {Date.new(2000,1,1) }
  end
end