FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name}
    last_name             {Faker::Name}
    furigana_first_name   {Faker::Name}
    furigana_last_name    {Faker::Name}
    birthday              {Faker::Date.backward}
  end
end    