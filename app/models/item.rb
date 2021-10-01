class Item < ApplicationRecord
  has_one_attached :image
  # validates :price, presence: true
  # validates :title, presence: true
  # validates :concept, presence: true
  
  # belongs_to :user
end