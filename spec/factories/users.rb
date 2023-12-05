FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太朗'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    date_of_birth         {'1996/12/06'}
  end
end