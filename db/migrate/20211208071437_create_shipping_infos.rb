class CreateShippingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infos do |t|
      t.string       :postal_code, null: false
      t.integer      :ship_form, null: false
      t.string       :city, null: false
      t.string       :house_number, null: false
      t.string       :building_name, null: false
      t.string       :phone_number, null: false
      t.references   :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
