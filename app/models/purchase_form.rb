class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_form, :city, :house_number, :building_name, :phone_number, :purchase_record_id

  def save

  end  
end  