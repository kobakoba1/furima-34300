FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-4567' }
    ship_form_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011112222' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end