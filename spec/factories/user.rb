FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'太郎'}
    last_name             {'山田'}
    furigana_first_name   {'タロウ'}
    furigana_last_name    {'ヤマダ'}
    birthday              {Faker::Date.backward}
  end
end    