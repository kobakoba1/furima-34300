class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price
      t.references :user, foreign_key: true
      t.string :title
      t.text :concept
      t.integer :category_id
      t.integer :item_condition_id
      t.integer :delivery_fee_id
      t.integer :ship_form_id
      t.integer :until_ship_day_id
      t.integer :prefectures_id
      t.timestamps
    end
  end
end
