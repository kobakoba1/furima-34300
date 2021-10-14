FactoryBot.define do
  factory :item do
    price    {Faker::Number.between(from: 300, to:9999999)}
    title    {Faker::Lorem.sentence}
    concept  {Faker::Lorem.sentence}
    category_id {'2'}
    item_condition_id {'2'}
    delivery_fee_id {'2'}
    ship_form_id {'2'}
    until_ship_day_id {'2'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
