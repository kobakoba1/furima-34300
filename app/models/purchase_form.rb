class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_form_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A0[5789]0\d{4}\d{4}\z/, message: "is only numbers within 11"}
    validates :ship_form_id, numericality: {other_than: 1, message: "can't be blank"}  
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingInfo.create(postal_code: postal_code, ship_form_id: ship_form_id, city: city, 
      house_number: house_number, building_name: building_name, phone_number: phone_number,
       purchase_record_id: purchase_record.id)
  end  
end  