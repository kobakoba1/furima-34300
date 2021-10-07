class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :ship_form
  belongs_to :until_ship_day
  # has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :concept, presence: true
  validates :category, presence: true
  validates :item_condition, presence: true
  validates :delivery_fee, presence: true
  validates :ship_form, presence: true
  validates :until_ship_day, presence: true
  validates :price, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  # belongs_to :user
end