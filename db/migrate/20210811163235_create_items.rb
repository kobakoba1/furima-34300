class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price
      t.references :user, foreign_key: true
      t.string :title
      t.text :concept
      t.integer :category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :ship_form_id, null: false
      t.integer :until_ship_day_id, null: false
      t.integer :prefectures_id, null: false
      t.timestamps
    end
  end
end
