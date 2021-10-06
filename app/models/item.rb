class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :ship_form
  belongs_to :until_ship_day
  # has_one_attached :image
  # validates :price, presence: true
  # validates :title, presence: true
  # validates :concept, presence: true
  
  # belongs_to :user
end