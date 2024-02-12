FactoryBot.define do
  factory :user do
    nickname              {'testuser'}
    email                 { Faker::Internet.unique.email }
    password              {'aaa000'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_data            { "1986-05-20" }
  end
end